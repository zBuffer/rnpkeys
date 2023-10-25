#!/bin/bash
docker build -t zbuffer/rnpkeys .
docker run -it --rm -v ./input:/root/input -v ./output:/root/output zbuffer/rnpkeys