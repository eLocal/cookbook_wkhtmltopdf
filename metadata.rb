# frozen_string_literal: true

name 'cookbook_wkhtmltopdf'
maintainer 'eLocal Development'
maintainer_email 'development@elocal.com'
license 'MIT'
description 'Cookbook for installing wkhtmltopdf on Ubuntu 18.04'
long_description <<~TXT
  wkhtmltopdf can be annoying to get working right on Ubuntu.
  This cookbook wraps wkhtmltopdf in xvfb to support headless and
  has libpng installed correctly.
TXT

version '0.1.0'
chef_version '>= 13.0'

source_url 'https://github.com/eLocal/cookbook_wkhtmltopdf'
issues_url 'https://github.com/eLocal/cookbook_wkhtmltopdf/issues'
supports 'ubuntu'

depends 'apt'
