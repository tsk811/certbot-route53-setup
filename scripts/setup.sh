yum update -y
yum install python3.12 unzip -y
python3.12 -m ensurepip --upgrade
pip3 install certbot certbot-dns-route53
cd /tmp
curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"
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