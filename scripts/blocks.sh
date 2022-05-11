#!/usr/bin/env bash

which apache2 && echo "Docker is installed"; echo "The docker version is $(apache2 -v)"  || echo "Docker is not installed"
