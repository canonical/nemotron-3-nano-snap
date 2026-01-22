#!/bin/bash

set -x

df -h
# Remove LFS object copies to reduce disk usage
#git lfs prune --force
#git gc --prune=now

rm -r .git/lfs/objects

df -h
