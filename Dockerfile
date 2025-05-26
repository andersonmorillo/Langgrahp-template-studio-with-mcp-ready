FROM python:3.11-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements and install Python dependencies
COPY app/pyproject.toml .
COPY app/src ./src

# Install langgraph-cli and project dependencies
RUN pip install --upgrade pip && \
    pip install -U "langgraph-cli[inmem]" && \
    pip install --no-cache-dir langgraph-cli && \
    pip install -e .

# Copy MCP server
COPY mcp_server ./mcp_server

# Set environment variables
ENV PYTHONPATH=/app
ENV PYTHONUNBUFFERED=1

# Expose ports
EXPOSE 8001 2024

# The actual command will be specified in docker-compose.yml
CMD ["python", "mcp_server/server.py"] 