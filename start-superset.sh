#! /bin/bash
. .venv/bin/activate
export SUPERSET_SECRET_KEY=1qaz2wsx
export FLASK_APP=superset
superset run -p 8088 --with-threads --reload --debugger
