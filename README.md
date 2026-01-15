# Nemotron3 Nano snap
[![nemotron3nano](https://snapcraft.io/#ADDLINK/badge.svg)](https://snapcraft.io/#ADDLINK)

This snap installs a hardware-optimized engine for inference with the [Nemotron 3 Nano](https://build.nvidia.com/nvidia/nemotron-3-nano-30b-a3b/modelcard)
large language model with reasoning capabilities built with an hybrid Mixture-of-Experts (MoE) architecture.

Install:
```
sudo snap install nemotron-snap --beta
```

Get help:
```
nemotron-snap --help
```

## Resources

📚 **[Documentation](https://documentation.ubuntu.com/inference-snaps/)**, learn how to use inference snaps

💬 **[Discussions](https://github.com/canonical/inference-snaps/discussions)**, ask questions and share ideas

🐛 **[Issues](https://github.com/canonical/inference-snaps/issues)**, report bugs and request features

## Build and install from source

Clone this repo with its submodules:
```shell
git clone --recurse-submodules https://github.com/canonical/nemotron-3-nano
```

Prepare the required models by following the instructions for each model, under the [components](./components) directory. 

Build the snap and its component:
```shell
snapcraft pack -v
```

Refer to the `./dev` directory for additional development tools.
