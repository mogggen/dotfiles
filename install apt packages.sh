#!/usr/bin/env bash

for i in $(cat pkglist); do sudo apt install $i; done
