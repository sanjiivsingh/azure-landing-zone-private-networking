# Troubleshooting

- **Public IP Resolution:** If a PaaS URL resolves to a public IP instead of `10.2.1.x`, verify that the VNet link to the Private DNS zone is active and that your DNS client queries Azure DNS (`168.63.129.16`).
