terraform {
  required_providers {
    esxi = {
      source = "registry.terraform.io/josenk/esxi"
    }
  }
}

provider "esxi" {
  esxi_hostname = var.esxi_hostname
  esxi_hostport = var.esxi_hostport
  esxi_hostssl  = var.esxi_hostssl
  esxi_username = var.esxi_username
  esxi_password = var.esxi_password
}

resource "esxi_guest" "webserver1" {
  guest_name   = "webserver-1"
  disk_store   = var.disk_store
  ovf_source   = var.ubuntu_ova_url
  memsize      = 2048
  numvcpus     = 1

  network_interfaces {
    virtual_network = var.network_name
  }

  guestinfo = {
    "metadata"          = filebase64("metadata-webserver1.yaml")
    "metadata.encoding" = "base64"
    "userdata"          = filebase64("userdata-webserver1.yaml")
    "userdata.encoding" = "base64"
  }

  provisioner "local-exec" {
    command = "echo ${self.ip_address} webserver-1 >> vm_ips.txt"
  }
}

resource "esxi_guest" "webserver2" {
  guest_name   = "webserver-2"
  disk_store   = var.disk_store
  ovf_source   = var.ubuntu_ova_url
  memsize      = 2048
  numvcpus     = 1

  network_interfaces {
    virtual_network = var.network_name
  }

  guestinfo = {
    "metadata"          = filebase64("metadata-webserver2.yaml")
    "metadata.encoding" = "base64"
    "userdata"          = filebase64("userdata-webserver2.yaml")
    "userdata.encoding" = "base64"
  }

  provisioner "local-exec" {
    command = "echo ${self.ip_address} webserver-2 >> vm_ips.txt"
  }
}

resource "esxi_guest" "databaseserver" {
  guest_name   = "databaseserver"
  disk_store   = var.disk_store
  ovf_source   = var.ubuntu_ova_url
  memsize      = 2048
  numvcpus     = 1

  network_interfaces {
    virtual_network = var.network_name
  }

  guestinfo = {
    "metadata"          = filebase64("metadata-databaseserver.yaml")
    "metadata.encoding" = "base64"
    "userdata"          = filebase64("userdata-databaseserver.yaml")
    "userdata.encoding" = "base64"
  }

  provisioner "local-exec" {
    command = "echo ${self.ip_address} databaseserver >> vm_ips.txt"
  }
}
