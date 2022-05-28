#!/bin/bash

set -e

export RAILS_ENV=production

rails db:migrate
rails db:seed

rails server

