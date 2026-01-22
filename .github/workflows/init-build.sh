#!/bin/bash

set -x

df -h
# Remove LFS object copies to reduce disk usage
git lfs prune --force

df -h

rm -vr .git 

df -h
