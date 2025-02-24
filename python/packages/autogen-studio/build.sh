#!/bin/bash

# Install backend dependencies
pip install -r requirements.txt

# Install frontend dependencies
npm install -g gatsby-cli
npm install --global yarn

cd frontend
yarn install
yarn build

gatsby clean && rmdir /s /q ..\\autogenstudio\\web\\ui 2>nul & (set \"PREFIX_PATH_VALUE=\" || ver>nul) && gatsby build --prefix-paths && xcopy /E /I /Y public ..\\autogenstudio\\web\\ui
