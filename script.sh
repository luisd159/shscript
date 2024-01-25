#!/bin/bash

# GIT Urls
NESTJS_REPO_URL="https://github.com/luisd159/backend-technicaltest.git"
REACTJS_REPO_URL="https://github.com/luisd159/frontend-technicaltest.git"

# Directory
CURRENT_DIR=$(pwd)
NESTJS_PROJECT_DIR="$CURRENT_DIR/backendFolder"
REACTJS_PROJECT_DIR="$CURRENT_DIR/frontendFolder"

# Cloning backend
echo "Cloning backend folder from GitHub..."
git clone "$NESTJS_REPO_URL" "$NESTJS_PROJECT_DIR"

# Cloning frontend
echo "Cloning Frontend folder from GitHub..."
git clone "$REACTJS_REPO_URL" "$REACTJS_PROJECT_DIR"

psql "CREATE DATABASE notes;"


