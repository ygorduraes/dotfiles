#!/usr/bin/env bash

# Prepare python
uv python install

# Tools
uv tool install --reinstall demucs --torch-backend=auto --with torchcodec
