#!/bin/bash

# Install backend dependencies
pip install -r requirements.txt

# Install frontend dependencies
npm install --global yarn

cd frontend
yarn install
npx gatsby build --prefix-paths

# Move built frontend to backend's expected location
mv public ../web/ui