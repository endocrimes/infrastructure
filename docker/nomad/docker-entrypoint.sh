#!/bin/bash

if [ "$1" == "start" ]; then
  shift

  echo "-- configuring 'advertise' setting"

  # Setup Defaults if needed
  [[ -z $BOOTSTRAP_EXPECT ]] && BOOTSTRAP_EXPECT=3
  [[ -z $DATACENTER ]] && DATACENTER=us-east-1
  [[ -z $REGION ]] && REGION=global
  [[ -z $SERVER_SERVICE_NAME ]] && SERVER_SERVICE_NAME=nomad


  # Update config
  sed -i "s|{{datacenter}}|$DATACENTER|g" /etc/nomad/default.hcl
  sed -i "s|{{region}}|$REGION|g" /etc/nomad/default.hcl
  sed -i "s|{{server_service_name}}|$SERVER_SERVICE_NAME|g" /etc/nomad/default.hcl

  echo "-- running 'nomad $*'"
  exec nomad "$@"
fi

exec "$@"
