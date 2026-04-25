# python-ml-docker

Shared CPU ML base image for Data Vault AI services.

This image owns the CPU embedding stack used by `rag-agent`, `sql-agent`, and
`vectorization-service-cpu`, including CPU-only PyTorch, sentence-transformers,
Transformers, ChromaDB, and LangChain integration packages. Centralizing those
dependencies here keeps service rebuilds fast and avoids version drift such as
`regex` / `transformers` mismatches.

GPU vectorization must not use this image because it needs a CUDA-capable
PyTorch runtime.
