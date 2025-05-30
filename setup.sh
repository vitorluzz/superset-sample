#! /bin/bash

echo "===================================================="

echo "Iniciando o projeto superset-sample..."

echo "Atualizando o pip e criando o ambiente .venv..."
python -m venv .venv && . .venv/bin/activate && python -m pip install --upgrade pip

echo "Instalando o Apache - SuperSet"
pip install apache_superset

echo "Solucionando o problema de inicialização..."
pip uninstall marshmallow && pip install marshmallow==3.26.1

echo "Configurando o serviço do superset..."
superset db upgrade
superset init
superset load_examples

echo "Permitindo a conexão com bancos de dados..."
sed -i 's/^PREVENT_UNSAFE_DB_CONNECTIONS *= *.*/PREVENT_UNSAFE_DB_CONNECTIONS = False/' .venv/lib/python3.11/site-packages/superset/config.py

echo "Copiando o banco de dados para a /tmp/"
cp github.db /tmp/

echo "Ambiente configurado com sucesso! ✅"

echo "===================================================="

