#!/bin/bash

# Remove LFS object copies to reduce disk usage
git lfs prune --force
