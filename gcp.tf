resource "google_compute_network" "vpc" {
name = "${var.instance_name_prefix}-vpc"
auto_create_subnetworks = true
}

resource "google_compute_firewall" "web" {
name = "${var.instance_name_prefix}-fw"
network = google_compute_network.vpc.name

allow {
protocol = "tcp"
ports = ["80"]
}

# Optional SSH
allow {
protocol = "tcp"
ports = ["22"]
}

source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_address" "web_ip" {
name = "${var.instance_name_prefix}-ip"
}

resource "google_compute_instance" "web" {
name = "${var.instance_name_prefix}-gcp"
machine_type = "e2-micro"
zone = var.gcp_zone

boot_disk {
initialize_params {
image = "debian-cloud/debian-12"
size = 10
}
}

network_interface {
network = google_compute_network.vpc.name
access_config {
nat_ip = google_compute_address.web_ip.address
}
}

metadata_startup_script = <<-EOT
#!/bin/bash
apt-get update -y
apt-get install -y nginx
echo "<h1>GCP NGINX — $(hostname)</h1>" > /var/www/html/index.nginx-debian.html
systemctl enable nginx
systemctl restart nginx
EOT

tags = ["http-server"]
}