# Nemotron 3 Nano

Model is available at:
https://huggingface.co/ggml-org/Nemotron-Nano-3-30B-A3B-GGUF

## Download the model

```shell
wget https://huggingface.co/ggml-org/Nemotron-Nano-3-30B-A3B-GGUF/resolve/main/Nemotron-Nano-3-30B-A3B-Q4_K_M.gguf
```

## Sharding
Nemotron 3 Nano model has been split into 6 shards and placed in the current directory.

```shell
llama-gguf-split --split-max-size 5G Nemotron-Nano-3-30B-A3B-Q4_K_M.gguf Nemotron-Nano-3-30B-A3B-Q4_K_M
```

## Model file path
The model file path is set to the first shard's symlink in order to allow the engine to load the entire sharded model correctly.
The server script creates symbolic links to all shards in a temporary directory (`/tmp/nemotron-3-nano-shards/`) at runtime.

## Model loading
In order to load the sharded model, `llama-server` needs to be pointed to the first shard file.
The `component.yaml` sets the `MODEL_FILE` environment variable to the path of the first shard's symlink.

