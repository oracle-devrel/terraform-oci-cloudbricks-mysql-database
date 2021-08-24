# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# datasource.tf
#
# Purpose: The following script defines the lookup logic used in code to obtain pre-created or JIT-created resources in tenancy.


/********** Compartment and CF Accessors **********/
data "oci_identity_compartments" "COMPARTMENTS" {
  compartment_id            = var.tenancy_ocid
  compartment_id_in_subtree = true
  filter {
    name   = "name"
    values = [var.mysql_instance_compartment_name]
  }
}

data "oci_identity_compartments" "NWCOMPARTMENTS" {
  compartment_id            = var.tenancy_ocid
  compartment_id_in_subtree = true
  filter {
    name   = "name"
    values = [var.mysql_network_compartment_name]
  }
}

data "oci_core_vcns" "VCN" {
  compartment_id = local.nw_compartment_id
  filter {
    name   = "display_name"
    values = [var.vcn_display_name]
  }
}


/********** Subnet Accessors **********/

data "oci_core_subnets" "SUBNET" {
  compartment_id = local.nw_compartment_id
  vcn_id         = local.vcn_id
  filter {
    name   = "display_name"
    values = [var.network_subnet_name]
  }
}


locals {
  # Subnet OCID Local accessor
  subnet_ocid = length(data.oci_core_subnets.SUBNET.subnets) > 0 ? data.oci_core_subnets.SUBNET.subnets[0].id : null

  # Compartment OCID Local Accessors
  compartment_id    = lookup(data.oci_identity_compartments.COMPARTMENTS.compartments[0], "id")
  nw_compartment_id = lookup(data.oci_identity_compartments.NWCOMPARTMENTS.compartments[0], "id")

  # VCN OCID Local Accessor
  vcn_id = lookup(data.oci_core_vcns.VCN.virtual_networks[0], "id")
}
