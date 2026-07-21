SHELL := /bin/bash

# Always run `hf` via pipx to avoid relying on local `hf` installations.
hf := pipx run --spec "huggingface_hub[cli]" hf

SNAP_NAME ?= smollm2
ENGINE ?= cpu

.PHONY: help all init init-submodules install-deps download-models download-model-30b-3ab build install upload smoke-test

all: help

#
# Main targets
#

help: ## Show this help message
	@echo "Usage: make <target>"
	@echo
	@echo "Targets:"
	@# List all targets with descriptions (lines starting with '##'):
	@grep -E '^[a-zA-Z0-9_-]+:.*## .*$$' $(MAKEFILE_LIST) | \
		sort | \
		awk 'BEGIN {FS = ":.*## "}; {printf "  %-11s %s\n", $$1, $$2}'

init: init-submodules install-deps download-models ## Initialize the build environment (dependencies, model weights, submodules, etc.)

build: init ## Build the snap
	./dev/build.sh

install: init ## Install the snap
	./dev/install.sh

upload: init ## Upload the snap
	./dev/upload.sh

smoke-test: init ## Run smoke tests (override with SNAP_NAME=... ENGINE=...)
	sudo ./dev/smoke-test.sh $(SNAP_NAME) $(ENGINE)

#
# Supporting targets
#

install-deps:
	@echo "Installing dependencies..."
	@# Ensure pipx is available for running the hf CLI.
	@command -v pipx >/dev/null 2>&1 || { \
		sudo apt-get update; \
		sudo apt-get install -y pipx; \
	}

init-submodules:
	@echo "Initializing submodules..."
	@if git submodule status | grep -q '^-'; then \
		git submodule update --init; \
	fi

download-models: download-model-30b-3ab
	
download-model-30b-3ab:
	@echo "Downloading Nemotron-Nano-3-30B-A3B-Q4_K_M model weights..."
	$(hf) download inference-snaps/Nemotron-Nano-3-30B-A3B-Q4_K_M-5GB \
		--local-dir components/model-30b-a3b-q4-k-m-gguf/
