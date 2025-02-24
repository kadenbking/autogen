#!/bin/bash
set -e  # Exit on error

# Install Python dependencies
pip install -r requirements.txt

# Install autogenstudio in editable mode
pip install -e .