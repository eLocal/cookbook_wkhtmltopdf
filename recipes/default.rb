# frozen_string_literal: true

# Make sure apt update is run
include_recipe 'apt::default'

# Ensure build packages are installed
package 'build-essential'
package 'zlib1g-dev'
package 'libc6-dev'
package 'make'

# When creating PDFs, they will need to run in a frame buffer
package 'xvfb'
package 'wkhtmltopdf'

# Super-annoying, deb in main Ubuntu repository for libpng does not work.
# Building from source
libpng_file_path = "#{Chef::Config['file_cache_path']}/libpng-#{node['wkhtmltopdf']['libpng']['version']}.tar.gz"

remote_file 'libpng zip required by wkhtmltopdf' do
  source node['wkhtmltopdf']['libpng']['download_url']
  checksum node['wkhtmltopdf']['libpng']['checksum']
  path     libpng_file_path
  backup   false
  retries  4
end

bash 'unarchive_libpng_source' do
  cwd  ::File.dirname(libpng_file_path)
  code <<-CMD
    tar zxf #{::File.basename(libpng_file_path)} -C #{::File.dirname(libpng_file_path)} --no-same-owner
  CMD
  not_if { ::File.directory?("#{Chef::Config['file_cache_path'] || '/tmp'}/libpng-#{node['wkhtmltopdf']['libpng']['version']}") }
end

bash 'compile_libpng_source' do
  cwd ::File.dirname(libpng_file_path)
  code <<-CMD
    cd libpng-#{node['wkhtmltopdf']['libpng']['version']} &&
    ./configure --prefix=/usr/local &&
    make && make install
  CMD

  not_if { ::File.exist?('/usr/local/lib/libpng12.so') }
end

# create wrapper script to run wkhtmltopdf within xvfb
file '/usr/local/bin/wkhtmltopdf-with-xvfb' do
  owner 'root'
  group 'root'
  mode 0o755
  content %(xvfb-run --auto-servernum --server-args="#{node['wkhtmltopdf']['xvfb']['server-args']}" /usr/bin/wkhtmltopdf $*)
end
