#!/bin/bash

jekyll build --source ./src/ --config _config.yml,_config_dev.yml --watch --incremental
