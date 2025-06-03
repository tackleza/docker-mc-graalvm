#!/bin/bash
docker pull tackleza/graalvm:latest
docker build -t tackleza/mc-graalvm:latest .
