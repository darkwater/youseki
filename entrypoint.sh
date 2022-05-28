#!/bin/bash

set -e

export RAILS_ENV=production

export SECRET_KEY_PATH=data/secret_key_base.key

if [ ! -f $SECRET_KEY_PATH ]; then
    echo "Generating $SECRET_KEY_PATH with a random key..."
    rake secret >$SECRET_KEY_PATH
    chmod 0400 $SECRET_KEY_PATH
fi

export SECRET_KEY_BASE="$(cat $SECRET_KEY_PATH)"

if [ ! -f data/production.sqlite3 ]; then
    rails db:setup
fi

rails db:migrate

rails server

