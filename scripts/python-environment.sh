#!/usr/bin/env bash

python3 -m venv .devops
ls -la
rm -rf ~/.cache/pip
. .devops/bin/activate

pip install -r requirements.txt