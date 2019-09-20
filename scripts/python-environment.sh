#!/usr/bin/env bash

python3 -m venv .devops
. .devops/bin/activate
pip install --upgrade pip && pip install -r requirements.txt