FROM mcr.microsoft.com/devcontainers/python:3.10

# Default working directory for your application
WORKDIR /app

# Install dependencies
RUN pip install -U gunicorn autogenstudio

# Set the working directory inside the container
WORKDIR $HOME/app

# Copy your application files (you can adjust as needed for Render)
COPY . $HOME/app

# Use Render's PORT environment variable
CMD gunicorn -w 2 --timeout 600 -k uvicorn.workers.UvicornWorker autogenstudio.web.app:app --bind "0.0.0.0:$PORT"

