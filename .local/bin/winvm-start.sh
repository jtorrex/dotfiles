#!/bin/bash

# Start the VM
virsh start win11

# Obtain the VM Domain
DOMAIN_ID=$(virsh domuuid --domain win11)

# Launch virt-manager agains the domain
virt-manager --connect qemu:///system --show-domain-console $DOMAIN_ID
#virt-viewer win11 &
