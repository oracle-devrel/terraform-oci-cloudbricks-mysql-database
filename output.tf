# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# output.tf
#
# Purpose: The following script defines the output for the mysql database system



output "mysql_db_system" {
  description = "MySQL Database DBSystem"
  value       = oci_mysql_mysql_db_system.DBSystem
  sensitive = true
}