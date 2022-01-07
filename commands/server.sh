#!/bin/bash

function http {
  if [ -z "$2" ]
  then
    echo "folder:$(pwd)"
    python -m SimpleHTTPServer $1
  else
    echo "folder:$2"
    pushd $2 ; python -m SimpleHTTPServer $1; popd
  fi
}

function https {  
  cert="${TMPDIR:-/tmp}"/cert.pem
  script="${TMPDIR:-/tmp}"/$(uuidgen).py

  # create your certs
  # openssl req -new -x509 -keyout $cert -out $cert -days 365 -nodes -subj '/C=GB/ST=London/L=London/O=Global Security/OU=IT Department/CN=example.com'

  echo "import BaseHTTPServer, SimpleHTTPServer" >> $script
  echo "import ssl" >> $script
  echo "import sys" >> $script
  echo "httpd = BaseHTTPServer.HTTPServer(('0.0.0.0', 4443), SimpleHTTPServer.SimpleHTTPRequestHandler)" >> $script
  echo "httpd.socket = ssl.wrap_socket (httpd.socket, certfile='/tmp/cert.pem', server_side=True)" >> $script
  echo "httpd.serve_forever()" >> $script

  if [ -z "$2" ]
  then
    echo "folder:$(pwd)"
    python $script
  else
    echo "folder:$2"
    pushd $2 ; python $script; popd
  fi
}

case $1 in
	http)
		http $(shuf -i 2000-65000 -n 1) ;;
	https)
		https $2 $3;;
	*) ;;
esac
