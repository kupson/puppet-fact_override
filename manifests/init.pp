# Define: fact_override
#
# This module can override some fact values
#
# Parameters:
# 
#   [*ensure*] - present|absent
#   [*value*]  - fact value
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
#   fact_override {
#     'ipaddress': value => $::ipaddress_eth0_500
#   }
#
define fact_override (
    $value,
    $ensure = 'present'
) {

    augeas {
        "fact_override_${title}":
            lens    => 'Shellvars.lns',
            context => '/files/etc/environment',
            incl    => '/etc/environment',
            changes => $ensure ? {
                         'present' => "set FACTER_${title} ${value}",
                         'absent'  => "rm FACTER_${title}",
                       };
    }

    if $require {
        Augeas["fact_override_${title}"] {
            require +> $require,
        }
    }

    if $before {
        Augeas["fact_override_${title}"] {
            before +> $before,
        }
    }

    if $notify {
        Augeas["fact_override_${title}"] {
            notify +> $notify,
        }
    }

    if $subscribe {
        Augeas["fact_override_${title}"] {
            subscribe +> $subscribe,
        }
    }

}
