echo -n "Input the FQDN: "
read hostname

echo -n "Input the IP: "
read ip

echo "[ req ]
default_bits = 2048
distinguished_name = req_distinguished_name
req_extensions = req_ext
prompt = no
[ req_distinguished_name ]
countryName = US
stateOrProvinceName = Taiwan
localityName = None
organizationName = None
commonName = $hostname
[SAN]
subjectAltName=DNS:$hostname,IP:$ip
[ req_ext ]
subjectAltName=DNS:$hostname,$ip" > service.cnf

openssl req -newkey rsa:2048 -x509 -nodes \
-keyout service.key -new -out service.crt -subj /CN=$hostname \
-reqexts SAN -extensions SAN -config ./service.cnf -sha256 -days 730
openssl x509 -in service.crt -text -noout

