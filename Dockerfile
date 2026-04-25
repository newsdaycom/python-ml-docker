# newsday/python-ml-base:cpu
FROM python:3.12-slim

RUN pip install --no-cache-dir \
  torch \
  --index-url https://download.pytorch.org/whl/cpu

RUN pip install --no-cache-dir \
  sentence-transformers \
  transformers \
  chromadb \
  langchain \
  langchain-openai