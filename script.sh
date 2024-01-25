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

DB_NAME="notes"

# Comando SQL para verificar y crear la base de datos si no existe
SQL_CHECK_CREATE_DB="
DO \$\$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_database WHERE datname = '$DB_NAME') THEN
        PERFORM dblink_connect('dbname=postgres');
        PERFORM dblink_exec('CREATE DATABASE $DB_NAME');
    END IF;
END
\$\$;
"

# Ejecutar el comando usando psql
psql -d postgres -c "$SQL_CHECK_CREATE_DB"

