# Override facter fact value or define a new one.

## Description
This module allows you to override an errant fact value or setup a new fact.

Warning:
- for defining mass amount of facts better look at puppet-stdlib module
- use FACTER_name environment variables in `/etc/environment` file - not suitable for more than few facts
- may require puppet/puppetmaster restart (it has to reload environment variables)
- TODO: on facter 2.x do use `/etc/facter.d/` directory instead of environment variables

## Parameters

-  [*ensure*] - present|absent
-  [*value*]  - fact value

## Usage

    # Do use vlan 500 address as main host IP
    fact_override {
      'ipaddress': value => $::ipaddress_eth0_500;
    }

