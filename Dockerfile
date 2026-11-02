FROM python:3.11-slim

WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy source code
COPY src /app/src

# Set environment variables for Python
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Port used by streamable HTTP transport; ignored for local stdio mode
EXPOSE 8000

# Run the MCP server via stdio transport module
CMD ["python", "-m", "src.server"]
