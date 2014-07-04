####Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with graphite_powershell](#setup)
    * [What graphite_powershell affects](#what-graphite_powershell-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with graphite_powershell](#beginning-with-graphite_powershell)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

##Overview

Module to send metrics to graphite from windows

##Module Description

Installs a windows service that reports system metrics to graphite

##Setup

###What graphite_powershell affects

* Powershell file and xml config file
* windows service

###Beginning with graphite_powershell

Install with defaults:

```puppet
  class { 'puppetversion':
    server => 'graphite.mycorp.com'
  }
```

Install and just send network counters:

```puppet
  class { 'puppetversion':
    server               => 'graphite.mycorp.com',
    performance_counters => [
      '\Network Interface(*)\Bytes Received/sec',
      '\Network Interface(*)\Bytes Sent/sec',
      '\Network Interface(*)\Packets Received Unicast/sec',
      '\Network Interface(*)\Packets Sent Unicast/sec',
      '\Network Interface(*)\Packets Received Non-Unicast/sec',
      '\Network Interface(*)\Packets Sent Non-Unicast/sec',
    ]
  }
```
##Usage

Put the classes, types, and resources for customizing, configuring, and doing the fancy stuff with your module here.

##Reference

###Classes
####Pulic Classes
* [`graphite_powershell`](#class-graphite_powershell): Guides the install of graphite powershell and creates the windows service

##Limitations

This module is tested on the following platforms:

* Windows 2008 R2

It is tested with the OSS version of Puppet only.

##Development

###Contributing

Please read CONTRIBUTING.md for full details on contributing to this project.

###Running tests

This project contains tests for both [rspec-puppet](http://rspec-puppet.com/) and [beaker](https://github.com/puppetlabs/beaker) to verify functionality. For in-depth information please see their respective documentation.

Quickstart:

    gem install bundler
    bundle install
    bundle exec rake spec
	BEAKER_DEBUG=yes bundle exec rspec spec/acceptance
