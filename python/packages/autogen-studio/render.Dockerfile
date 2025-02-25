# Use a Python base image
FROM mcr.microsoft.com/devcontainers/python:3.10

# Install Node.js and npm
RUN apt-get update && apt-get install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# Confirm Node.js and npm installation
RUN node -v && npm -v

# Set the working directory
WORKDIR /code

# Install files
COPY . /code/
RUN pip install -r /code/requirements.txt

# Install Node.js and build frontend
RUN npm install -g gatsby-cli
WORKDIR /code/frontend
RUN yarn install && npx gatsby build --prefix-paths

# Copy the built frontend to the correct folder
RUN mv /code/frontend/public /code/autogenstudio/web/ui

# Install the app in editable mode
RUN pip install -e /code/

# Expose the necessary ports
EXPOSE 10000

# Start the backend and frontend (using `autogenstudio ui`)
CMD ["autogenstudio", "ui", "--host", "0.0.0.0", "--port", "10000"]

