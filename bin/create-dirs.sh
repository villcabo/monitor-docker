#!/bin/bash

dirs="prometheus,loki,grafana-data,grafana-provisioning"
IFS=',' read -r -a array <<< "$dirs"

for dir in "${array[@]}"; do
  full_path="./data/$dir"

  if [ ! -d "$full_path" ]; then
    echo "Creating directory $full_path"
    mkdir -p "$full_path"
    sudo chown -R 65534:65534 "$full_path"
    echo "Set ownership to 65534:65534 for $full_path"
  else
    current_owner=$(stat -c "%u:%g" "$full_path")
    if [ "$current_owner" != "65534:65534" ]; then
      echo "Updating ownership for $full_path"
      sudo chown -R 65534:65534 "$full_path"
    else
      echo "Ownership for $full_path is already set to 65534:65534"
    fi
  fi
done
