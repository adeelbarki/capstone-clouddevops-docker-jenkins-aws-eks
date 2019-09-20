#!/usr/bin/env bash

apt-get install python3-venv
python3 -m venv .devops
. .devops/bin/activate
pip install --upgrade pip && pip install -r requirements.txt