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

# Creating DataBase
DB_NAME="notes"

# SQL commands for verifications
SQL_CHECK_CREATE_DB="SELECT 'CREATE DATABASE $DB_NAME'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = '$DB_NAME')\gexec"

# Connect to postresql and run the commands
psql -c "$SQL_CHECK_CREATE_DB"

