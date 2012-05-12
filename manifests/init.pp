# Define: fact_override
#
# This module can override some fact values
#
# Parameters:
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
    $value
) {

    augeas {
        "fact_override_${title}":
            lens    => 'Shellvars.lns',
            context => '/files/etc/environment',
            incl    => '/etc/environment',
            changes => "set FACTER_${title} ${value}";
    }

    if $require {
        Augeas["fact_override_${title}"] {
            require +> $require,
        }
    }

}
