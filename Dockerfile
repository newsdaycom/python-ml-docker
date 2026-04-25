# newsday/python-ml-base:cpu
FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PIP_NO_CACHE_DIR=1

WORKDIR /usr/app

# Install CPU-only PyTorch from the PyTorch CPU wheel index. This is separate
# from requirements.txt because the PyTorch index does not host packages such as
# sentence-transformers or ChromaDB. Keeping torch isolated also prevents CPU
# service images from accidentally pulling CUDA/GPU wheels.
COPY requirements-cpu-torch.txt .
RUN pip install --no-cache-dir \
    --index-url https://download.pytorch.org/whl/cpu \
    -r requirements-cpu-torch.txt

# Install the shared CPU embedding/vector stack from normal PyPI. Downstream CPU
# services inherit these packages and should only install app-specific
# dependencies in their own images.
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
