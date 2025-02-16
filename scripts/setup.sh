yum update -y
yum install python3.12 unzip -y
python3.12 -m ensurepip --upgrade
pip3 install certbot certbot-dns-route53

# Detect system architecture and download appropriate AWS CLI package
ARCH=$(uname -m)
cd /tmp
if [ "$ARCH" = "aarch64" ]; then
    curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"
else
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
fi
unzip awscliv2.zip
./aws/install
/usr/local/bin/aws --version

certbot certonly --agree-tos \
    --dns-route53 \
    --register-unsafely-without-email \
    --non-interactive \
    --new-key \
    --key-type rsa \
    -d $CERT_DOMAIN

/usr/local/bin/aws s3 sync /etc/letsencrypt/live/ s3://$CERT_BUCKET/$CERT_DOMAIN/