#!/bin/bash
apt update -y
apt install -y python3-pip
pip3 install fastapi uvicorn grpcio