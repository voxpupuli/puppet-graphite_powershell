# Graphite PowerShell module for Puppet

[![Build Status](https://travis-ci.org/voxpupuli/puppet-graphite_powershell.png?branch=master)](https://travis-ci.org/voxpupuli/puppet-graphite_powershell)
[![Code Coverage](https://coveralls.io/repos/github/voxpupuli/puppet-graphite_powershell/badge.svg?branch=master)](https://coveralls.io/github/voxpupuli/puppet-graphite_powershell)
[![Puppet Forge](https://img.shields.io/puppetforge/v/puppet/graphite_powershell.svg)](https://forge.puppetlabs.com/puppet/graphite_powershell)
[![Puppet Forge - downloads](https://img.shields.io/puppetforge/dt/puppet/graphite_powershell.svg)](https://forge.puppetlabs.com/puppet/graphite_powershell)
[![Puppet Forge - endorsement](https://img.shields.io/puppetforge/e/puppet/graphite_powershell.svg)](https://forge.puppetlabs.com/puppet/graphite_powershell)
[![Puppet Forge - scores](https://img.shields.io/puppetforge/f/puppet/graphite_powershell.svg)](https://forge.puppetlabs.com/puppet/graphite_powershell)

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with graphite_powershell](#setup)
    * [What graphite_powershell affects](#what-graphite_powershell-affects)
    * [Beginning with graphite_powershell](#beginning-with-graphite_powershell)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

Module to send metrics to graphite from windows

## Module Description

Installs a windows service that reports system metrics to graphite

## Setup

### What graphite_powershell affects

* Powershell file and xml config file
* windows service

### Beginning with graphite_powershell

Install with defaults:

```puppet
  class { 'graphite_powershell':
    server => 'graphite.mycorp.com'
  }
```

Install and just send network counters:

```puppet
  class { 'graphite_powershell':
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

## Usage

### Classes and Defined Types

#### Class: `graphite_powershell`

**Parameters within `graphite_powershell`:**

##### `server`

The graphite server in which to send the configured metrics

##### `install_url`

The url from which to download the graphite powershell script

##### `install_dir`

The location in which to install the graphite powershell script

##### `port`

The port that the graphite server is running on.

##### `metric_path`

The graphite namespece in which the stats will be sent to

##### `metric_send_interval`

The time inveral (in seconds) in which to send metrics to the graphite server

##### `timezone`

The timezone of your graphite server.

##### `performance_counters`

A list of the performance counters that you want to be sent to graphite.

##### `metric_filters`

A list of names you want to filter out of the performance counter list

##### `verbose_logging`

If enabled, will log each of the metrics that were sent to the graphite server.

## Reference

### Classes

#### Pulic Classes

* [`graphite_powershell`](#class-graphite_powershell):
  Guides the install of graphite powershell and creates the windows service

## Limitations

This module is tested on the following platforms:

* Windows 2008
* Windows 2008 R2
* Windows 2012
* Windows 2012 R2

It is tested with the OSS version of Puppet only.

### Contributing

Please read CONTRIBUTING.md for full details on contributing to this project.
