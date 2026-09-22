# Nemotron 3 Nano inference snap
[![nemotron-3-nano](https://snapcraft.io/nemotron-3-nano/badge.svg)](https://snapcraft.io/nemotron-3-nano)

NVIDIA Nemotron 3 Nano is a large language model with reasoning capabilities built with a hybrid Mixture-of-Experts (MoE) architecture.

Use this snap to quickly install an optimized environment for local inference with Nemotron 3 Nano.

The snap includes the following hardware-optimized inference engines:

* cpu: Optimized for x64 and ARM (armv8, armv9) CPUs
* nvidia-gpu: CUDA-enabled GPU acceleration

The most suitable engine is automatically selected based on the available hardware.

#### Install
```shell
sudo snap install nemotron-3-nano
```

#### Run
```shell
nemotron-3-nano
```

> [!TIP]
> Some accelerators require extra [drivers](https://documentation.ubuntu.com/inference-snaps/how-to/setup/drivers/) to be usable with this snap.

## Resources

📚 **[Documentation](https://documentation.ubuntu.com/inference-snaps/)**, learn how to use inference snaps

💬 **[Discussions](https://github.com/canonical/inference-snaps/discussions)**, ask questions and share ideas

🐛 **[Issues](https://github.com/canonical/inference-snaps/issues)**, report bugs and request features

## Build and install from source

Clone the repo:
```shell
git clone https://github.com/canonical/nemotron-3-nano-snap
cd nemotron-3-nano-snap
```

Initialize the development environment:
```shell
make init
```

Build and install snap:
```shell
make build
make install
```
