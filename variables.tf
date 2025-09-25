variable "esxi_hostname" {
  description = "IP-adres ESXi-server"
  type        = string
  default     = "192.168.1.2"
}

variable "esxi_hostport" {
  description = "SSH-poort ESXi-server"
  type        = number
  default     = 22
}

variable "esxi_hostssl" {
  description = "SSL-poort ESXi-server"
  type        = number
  default     = 443
}

variable "esxi_username" {
  description = "Gebruikersnaam"
  type        = string
  default     = "root"
}

variable "esxi_password" {
  description = "Wachtwoord"
  type        = string
  default     = "Welkom01!"
  sensitive   = true
}

variable "disk_store" {
  description = "VM-schijven"
  type        = string
  default     = "vm-disk"
}

variable "network_name" {
  description = "virtuele netwerk op ESXi"
  type        = string
  default     = "VM Network"
}

variable "ubuntu_ova_url" {
  description = "URL Ubuntu 24.04 cloud image"
  type        = string
  default     = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.ova"
}

variable "vm_user" {
  description = "Gebruikersnaam VM's"
  type        = string
  default     = "Student"
}

variable "ssh_public_key" {
  description = "Openbare ED25519 SSH-sleutel"
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFTpBJNPuYjaDheQjVLVZas37Q9tyKuoT9YcN+SvTxc5 student@DESKTOP-1NUD89T"
}