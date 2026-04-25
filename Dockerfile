# newsday/python-ml-base:cpu
FROM python:3.12-slim

RUN pip install --no-cache-dir \
  --index-url https://download.pytorch.org/whl/cpu \
  torch \
  sentence-transformers \
  transformers \
  chromadb \
  langchain \
  langchain-openai