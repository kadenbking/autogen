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
CMD CMD autogenstudio ui --host 0.0.0.0 --port $PORT

