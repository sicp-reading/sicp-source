#!/bin/bash

virtualenv -p python2.7 --no-site-packages --clear --distribute venv
source venv/bin/activate; pip install -r requirements.txt
