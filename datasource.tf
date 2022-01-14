# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# datasource.tf
#
# Purpose: The following script defines the lookup logic used in code to obtain pre-created or JIT-created resources in tenancy.


/********** Compartment and CF Accessors **********/
data "oci_identity_compartments" "COMPARTMENTS" {
  count = var.mysql_instance_compartment_ocid == "" ? 1 : 0
  compartment_id            = var.tenancy_ocid
  compartment_id_in_subtree = true
  filter {
    name   = "name"
    values = [var.mysql_instance_compartment_name]
  }
}

data "oci_identity_compartments" "NWCOMPARTMENTS" {
  count = var.mysql_network_compartment_ocid == "" ? 1 : 0
  compartment_id            = var.tenancy_ocid
  compartment_id_in_subtree = true
  filter {
    name   = "name"
    values = [var.mysql_network_compartment_name]
  }
}

data "oci_core_vcns" "VCN" {
  count = var.subnet_id == "" ? 1 : 0
  compartment_id = local.nw_compartment_id
  filter {
    name   = "display_name"
    values = [var.vcn_display_name]
  }
}


/********** Subnet Accessors **********/

data "oci_core_subnets" "SUBNET" {
  count = var.subnet_id == "" ? 1 : 0
  compartment_id = local.nw_compartment_id
  vcn_id         = local.vcn_id
  filter {
    name   = "display_name"
    values = [var.network_subnet_name]
  }
}


locals {
  # Subnet OCID Local accessor
  subnet_ocid = var.subnet_id == "" ? (length(data.oci_core_subnets.SUBNET[0].subnets) > 0 ? data.oci_core_subnets.SUBNET[0].subnets[0].id : null) : null

  # Compartment OCID Local Accessors
  compartment_id    = var.mysql_instance_compartment_ocid == "" ? lookup(data.oci_identity_compartments.COMPARTMENTS[0].compartments[0], "id") : null
  nw_compartment_id = var.mysql_network_compartment_ocid == "" ? lookup(data.oci_identity_compartments.NWCOMPARTMENTS[0].compartments[0], "id") : null

  # VCN OCID Local Accessor
  vcn_id = var.subnet_id == "" ? lookup(data.oci_core_vcns.VCN[0].virtual_networks[0], "id") : null
}
