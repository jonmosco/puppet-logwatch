# logwatch

[![Build Status](https://travis-ci.org/jonmosco/puppet-logwatch.svg?branch=master)](https://travis-ci.org/jonmosco/puppet-logwatch)

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with logwatch](#setup)
  ¦ * [What logwatch affects](#what-logwatch-affects)
  ¦ * [Setup requirements](#setup-requirements)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
6. [Limitations - OS compatibility, etc.](#limitations)
7. [Development - Guide for contributing to the module](#development)
    * [Contributing](#contributing)

## Overview

The logwatch module configures logwatch on Linux bases systems.

## Module Description

The logwatch module will manage the installation and configuration of logwatch
on Linux based systems.

## Setup

**NOTE: You must have a proper MTA installed and configured to send mail externally.**

By default, logwatch will monitor all services it knows how to.

### Concat

This module requires puppetlabs-concat >= 2.2.1

### What logwatch affects

 * logwatch package.
 * logwatch configuration files.

## Usage

#### Using default values

```puppet
  class { '::logwatch': }
```

#### Using available parameters

```puppet
 class { '::logwatch':
   mail_to   => [ 'test@test.com ', 'more@test.com' ],
   mail_from => 'puppet@test.com',
   service   => [ 'sshd', 'httpd' ],
 }
```

#### Managing `ignore.conf`

Add a regex to `ignore.conf` to suppress that output from the logwatch report

```puppet
  logwatch::ignore { 'my_rule':
    regex => 'ignore_lines_that_match_this_regex',
  }
```

## Reference

### Classes

#### Public Classes

* logwatch: Main class, includes all other classes.
* logwatch::ignore: Manage the contents of `ignore.conf`

#### Private Classes

* logwatch::install: Handles the packages.
* logwatch::config: Handles the configuration file.

#### Parameters

##### `logwatch`

```
 $output - Acceptable values include unformatted, stdout - defaults to 'unformatted'
 $format - Acceptable values include html or text - defaults to 'text'
 $mail_to - Array of email addresses to send to
 $mail_from - email address for logwatch 'from' emails
 $range - Requires a regex op ^All$, ^Today$, or ^Yesterday$.
 $detail - Requires a regex of ^Low$, ^Med$, or ^$High'.
 $service - Array of services to watch, defaults to 'All'
 $package_ensure - ensure the package is installed or latest or present
 $package_name - the name of the pacakge to install, logwatch typically is sufficient

```

##### `logwatch::ignore`

```
regex
```

## Limitations

This module has been built on and tested against Puppet 6.

The module has been tested on:

* RedHat Enterprise Linux 7/8 (including Rocky Linux)
* CentOS 7/8
* Ubuntu 18.04/20.04

## Development

### Contributing
