# Create VPC Network
resource "google_compute_network" "vpc_network" {
  name                    = "tf-demo-network"
  auto_create_subnetworks = true
}

# Create Compute Engine Instance
resource "google_compute_instance" "vm_instance" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = "${var.region}-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {}
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    sudo apt-get update -y
    sudo apt-get install -y nginx
    systemctl start nginx
  EOT

  tags = ["web", "terraform"]
}
