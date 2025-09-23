# Use official slim Python 3.12 image
FROM python:3.12-slim

# Set environment variables

WORKDIR /app

# Copy only requirements first for caching
COPY requirements.txt .

# Install pip dependencies
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy the entire project
COPY . .

# Expose port 8000 for FastAPI
EXPOSE 8000

# Default command to run FastAPI with reload (dev mode)
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
