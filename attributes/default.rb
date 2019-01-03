# frozen_string_literal: true

default['wkhtmltopdf']['libpng']['version'] = '1.2.54'
default['wkhtmltopdf']['libpng']['download_url'] =
  'https://sourceforge.net/projects/libpng/files/libpng12/older-releases/' \
    "#{node['wkhtmltopdf']['libpng']['version']}/" \
    "libpng-#{node['wkhtmltopdf']['libpng']['version']}.tar.gz"

default['wkhtmltopdf']['libpng']['checksum'] = 'e3980cd370cc0262095689f4e517b86106e42ecce10714006ea7d671ca86b68e'

default['wkhtmltopdf']['xvfb']['server-args'] = '-screen 0, 1024x768x24'
