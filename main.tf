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

resource "esxi_guest" "testserver1" {
  guest_name   = "testserver1"
  disk_store   = var.disk_store
  ovf_source   = var.ubuntu_ova_url
  memsize      = 2048
  numvcpus     = 1

  network_interfaces {
    virtual_network = var.network_name
  }

  guestinfo = {
    "metadata"          = filebase64("metadata-testserver1.yaml")
    "metadata.encoding" = "base64"
    "userdata"          = filebase64("userdata-testserver1.yaml")
    "userdata.encoding" = "base64"
  }

  provisioner "local-exec" {
    command = "echo ${self.ip_address} testserver1 >> vm_ips.txt"
  }
}

resource "local_file" "ansible_inventory" {
  content = <<-EOT
    [demo]
    ${esxi_guest.testserver1.ip_address} app_name=demoapp
  EOT
  filename = "${path.module}/inventory.ini"
}
