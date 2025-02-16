# Automated SSL Certificate Generator with AWS Route53

This project automates the process of generating SSL certificates using Let's Encrypt's Certbot with DNS validation through AWS Route53. The certificates are then stored in an AWS S3 bucket for easy access and management.

## Overview

The automation script:
- Sets up Python and required dependencies in a Red Hat Universal Base Image (UBI) container
- Installs and configures AWS CLI
- Generates SSL certificates using Certbot with Route53 DNS validation
- Automatically uploads certificates to a specified S3 bucket

## Prerequisites

- Docker installed on your system
- Visual Studio Code with Remote - Containers extension
- AWS credentials configured in your `~/.aws` directory
- AWS Account with:
  - Route53 configured for your domain
  - S3 bucket for certificate storage

## Development Environment

This project uses Visual Studio Code's Dev Containers feature to provide a consistent development environment. The container is based on Red Hat's Universal Base Image (UBI 8) and includes all necessary dependencies.

### Dev Container Features
- Red Hat UBI 8 base image
- Automatic AWS credentials mounting from host
- Pre-configured environment variables
- Automated setup script execution

## Getting Started

1. Clone this repository:
```bash
git clone https://github.com/yourusername/certbot.git
cd certbot
```

2. Ensure your AWS credentials are properly configured in `~/.aws/config` and `~/.aws/credentials`

3. Open the project in VS Code:
```bash
code .
```

4. When prompted, click "Reopen in Container" or use the command palette (F1) and select "Remote-Containers: Reopen in Container"

The container will:
- Mount your AWS credentials automatically
- Set up the required environment variables
- Run the setup script automatically

## Configuration

The project uses environment variables that must be configured in your devcontainer.json file:

- `CERT_DOMAIN`: The domain for certificate generation
- `CERT_BUCKET`: The S3 bucket for certificate storage
- AWS credentials are automatically mounted from your local ~/.aws directory

**Important**: Make sure to update these environment variables in your devcontainer.json file before starting the container. The project will not function correctly without proper configuration.

## What the Setup Script Does

The `setup.sh` script, which runs automatically when the container starts:
1. Updates system packages
2. Installs Python 3.12 and dependencies
3. Installs Certbot with Route53 plugin
4. Installs AWS CLI
5. Generates SSL certificate using Let's Encrypt
6. Uploads the certificate to S3

## Certificate Location

- Local: `/etc/letsencrypt/live/[domain]/`
- S3: `s3://[CERT_BUCKET]/[CERT_DOMAIN]/`

## Important Notes

- The script uses non-interactive mode for automated certificate generation
- Certificates are valid for 90 days
- AWS credentials are mounted read-only for security
- The container environment ensures consistent behavior across different development machines

## Contributing

1. Fork the repository
2. Create your feature branch
3. Open the project in Dev Container
4. Make your changes
5. Submit a Pull Request