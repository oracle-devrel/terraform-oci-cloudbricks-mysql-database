# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# variables.tf 
#
# Purpose: The following file declares all variables used in this backend repository

/********** Provider Variables NOT OVERLOADABLE **********/
variable "region" {
  description = "Target region where artifacts are going to be created"
}

variable "tenancy_ocid" {
  description = "OCID of tenancy"
}

variable "user_ocid" {
  description = "User OCID in tenancy. Currently hardcoded to user denny.alquinta@oracle.com"
}

variable "fingerprint" {
  description = "API Key Fingerprint for user_ocid derived from public API Key imported in OCI User config"
}


/********** Provider Variables NOT OVERLOADABLE **********/

/********** Brick Variables **********/

/********** MySQL Variables **********/
variable "mysql_instance_compartment_name" {
  description = "Compartment where MySQL Instance will be created"
}

variable "mysql_network_compartment_name" {
  description = "Compartment where the network of MySQL artifact is"
}

variable "mysql_db_system_admin_password" {
  description = "(Required) The password for the administrative user. The password must be between 8 and 32 characters long, and must contain at least 1 numeric character, 1 lowercase character, 1 uppercase character, and 1 special (nonalphanumeric) character."
}

variable "mysql_db_system_admin_username" {
  description = "(Required) The username for the administrative user."
}

variable "mysql_db_system_availability_domain" {
  description = "(Required) The availability domain on which to deploy the Read/Write endpoint. This defines the preferred primary instance. In a failover scenario, the Read/Write endpoint is redirected to one of the other availability domains and the MySQL instance in that domain is promoted to the primary instance. This redirection does not affect the IP address of the DB System in any way. For a standalone DB System, this defines the availability domain in which the DB System is placed."
}

variable "mysql_shape_name" {
  description = "(Required) The name of the shape. The shape determines the resources allocated. CPU cores and memory for VM shapes; CPU cores, memory and storage for non-VM (or bare metal) shapes. To get a list of shapes, use the ListShapes operation."
}

variable "mysql_db_system_backup_policy_is_enabled" {
  description = "Boolean that defines if either backup is enabled or not"
  default     = false
}

variable "mysql_db_system_backup_policy_retention_in_days" {
  description = "The number of days automated backups are retained."
  default     = ""
}

variable "mysql_db_system_backup_policy_window_start_time" {
  description = "The start of a 30-minute window of time in which daily, automated backups occur. This should be in the format of the Time portion of an RFC3339-formatted timestamp. Any second or sub-second time data will be truncated to zero. At some point in the window, the system may incur a brief service disruption as the backup is performed."
  default     = ""
}

variable "mysql_db_system_data_storage_size_in_gb" {
  description = "Initial size of the data volume in GiBs that will be created and attached."
}

variable "mysql_db_system_description" {
  description = "User-provided data about the DB System."
}

variable "mysql_db_system_display_name" {
  description = "The user-friendly name for the DB System. It does not have to be unique."
}

variable "mysql_db_system_fault_domain" {
  description = "The fault domain on which to deploy the Read/Write endpoint. This defines the preferred primary instance."
}

variable "mysql_db_system_hostname_label" {
  description = "The hostname for the primary endpoint of the DB System. Used for DNS. The value is the hostname portion of the primary private IP's fully qualified domain name (FQDN) (for example, dbsystem-1 in FQDN dbsystem-1.subnet123.vcn1.oraclevcn.com). Must be unique across all VNICs in the subnet and comply with RFC 952 and RFC 1123."

}

variable "mysql_db_system_is_highly_available" {
  description = "Boolean that describes if either HA is enabled or not"
  default     = false
}

variable "mysql_db_system_maintenance_window_start_time" {
  description = "(Required) (Updatable) The start of the 2 hour maintenance window. This string is of the format: {day-of-week} {time-of-day}. {day-of-week} is a case-insensitive string like mon, tue, etc. {time-of-day} is the Time portion of an RFC3339-formatted timestamp. Any second or sub-second time data will be truncated to zero."

}

variable "mysql_db_system_port" {
  description = "(Optional) The port for primary endpoint of the DB System to listen on."
  default     = "3306"
}

variable "mysql_db_system_port_x" {
  description = "(Optional) The TCP network port on which X Plugin listens for connections. This is the X Plugin equivalent of port."
  default     = "33060"
}

/********** MySQL Variables **********/

/********** Datasource and Subnet Lookup related variables **********/
variable "network_subnet_name" {
  description = "Defines the subnet display name where this resource will be created at"
}

variable "vcn_display_name" {
  description = "VCN Display name to execute lookup"
}
/********** Datasource related variables **********/

/********** Brick Variables **********/
