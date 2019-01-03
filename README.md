# cookbook_wkhtmltopdf

## About

Installs wkhtmltopdf integrated with libpng and with a script wrapping the result in xvfb.

Some examples of the problems that we are solving with the repository

* [Setting wkhtmltopdf in PDFKit](https://github.com/pdfkit/pdfkit/pull/388)
* [Using wkhtmltopdf without X server](https://github.com/JazzCore/python-pdfkit/wiki/Using-wkhtmltopdf-without-X-server)
* [Libpng12 needed for Ubuntu 17.10](https://askubuntu.com/questions/966757/libpng12-needed-for-17-10)

## Usage

```
include_recipe cookbook_wkhtmltopdf::default
```

## Development

1. Install Prerequisites

* [Brew](http://brew.sh)
* [Chef Workstation](https://www.chef.sh/about/chef-workstation/)

```
brew cask install chef/chef/chef-workstation
```

2. Use the [Kitchen](https://kitchen.ci) to run [InSpec](https://www.inspec.io/) tests.

```
KITCHEN_EC2_SUBNET_ID=subnet-XXXXXX kitchen test
```

3. Run FoodCritic Linter

```
foodcritic .
```

4. Run Rubocop

```
rubocop .
```