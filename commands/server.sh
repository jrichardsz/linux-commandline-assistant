#!/bin/bash

: '''
# Server command

This command start an http server pointing to the cwd

Usage:

jarvis server http 8080

'''#end-readme

function http {
  start_python_server $1
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

function start_python_server {
  python_binary=

  if ! hash python; then
      #echo "python is not installed"
      if ! hash python2; then
          #echo "python2 is not installed"
          if ! hash python3; then
              echo "python , python2 and python3 where not found. Python is required to start the server"
              exit 1
          else
              python_binary=python3
          fi
      else
          python_binary=python2
      fi
  else
      python_binary=python
  fi

  echo "Python was found: $python_binary"

  version=$($python_binary -V 2>&1 | grep -Po '(?<=Python )(.+)' | cut -d . -f 1)
  if [[ -z "$version" ]]
  then
      echo "No Python!" 
  fi

  case $version in
    2)
      $python_binary -m SimpleHTTPServer $1 ;;
    3)
      $python_binary -m http.server $1;;
    *) ;;
  esac

}

case $1 in
	http)
		http $2 ;;
	https)
		https $2 $3;;
	*) ;;
esac
