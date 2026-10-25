#!/bin/sh
# SPARK.Chroma v1 — everything the worker image needs. The Dockerfile in your copy downloads this file
# from the original repo on every build, so fixes made there reach you with a rebuild.
set -eu

# file <dest> <url> <sha256>
file() {
  wget -q -O "$1" "$2"
  echo "$3  $1" | sha256sum -c - || { echo "ERROR: $1 changed upstream — wait for an update of the original repo, then rebuild" >&2; exit 1; }
}

# SG161222/SPARK.Chroma_v1 (Apache 2.0) (17.8 GB)
file /comfyui/models/diffusion_models/SPARK.Chroma_v1_1024.safetensors \
  "https://huggingface.co/SG161222/SPARK.Chroma_v1/resolve/61c8d52847117642cb6bc25a7059b0aebd807b94/SPARK.Chroma_v1_1024.safetensors" \
  2b5eb906039d73bf18e28c0ec0f0a8c21a462237f0c6758285f0365a4f44e0f0

# comfyanonymous/flux_text_encoders (4.9 GB)
file /comfyui/models/text_encoders/t5xxl_fp8_e4m3fn.safetensors \
  "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/6af2a98e3f615bdfa612fbd85da93d1ed5f69ef5/t5xxl_fp8_e4m3fn.safetensors" \
  7d330da4816157540d6bb7838bf63a0f02f573fc48ca4d8de34bb0cbfd514f09

# Comfy-Org repack (FLUX VAE) (0.3 GB)
file /comfyui/models/vae/ae.safetensors \
  "https://huggingface.co/Comfy-Org/Lumina-Image-2/resolve/5b072540ef86570fecb8249c505f23d5bdeb88cd/split_files/vae/ae.safetensors" \
  afc8e28272cd15db3919bacdb6918ce9c1ed22e96cb12c4d5ed0fba823529e38
