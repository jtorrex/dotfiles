#!/bin/bash
for i in $(sudo virsh list --name); do sudo virsh destroy --domain $i; done
