#!/bin/bash

ps -ef | grep "$1" | grep -v grep| grep -v taskkill.sh

kill -9 $(ps -ef | grep "$1" | grep -v grep| grep -v "taskkill.sh")