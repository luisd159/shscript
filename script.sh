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

# initializing postgresql
echo "initializing PostgreSQL..."
sudo service postgresql start

# Name For DataBase
DB_NAME="notes"

# SQL commands for verifications
SQL_CHECK_CREATE_DB="SELECT 'CREATE DATABASE $DB_NAME'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = '$DB_NAME')\gexec"

# Connect to postresql and run the commands
psql -c "$SQL_CHECK_CREATE_DB"


# initializing backend
echo "Waiting for backend server..."
cd "$NESTJS_PROJECT_DIR"
npm install
npm run start:dev & 

# waiting for backend
echo "Witing for backend server..."
sleep 10

# initializing frontend
echo "Waiting for frontend server..."
cd "../$REACTJS_PROJECT_DIR"
npm install
npm start &

# keep code working
wait
