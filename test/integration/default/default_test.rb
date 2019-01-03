# frozen_string_literal: true

# Inspec test for recipe cookbook_wkhtmltopdf::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe file('/usr/bin/wkhtmltopdf') do
  it { should exist }
end

describe file('/usr/local/bin/wkhtmltopdf-with-xvfb') do
  it { should exist }
end

describe file('/usr/local/lib/libpng12.so') do
  it { should be_symlink }
end

describe file('/usr/local/lib/libpng12.so.0.54.0') do
  it { should be_file }
end
