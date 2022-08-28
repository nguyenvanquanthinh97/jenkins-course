#!/bin/bash
NAME=$1
LASTNAME=$2
SHOW=$3

if [ "$SHOW" = "true" ]; then
  echo "Hello $1 $2"
else
  echo "If you want to see the name, please mark the show option"
fi
