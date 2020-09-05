#!/bin/bash

ADDRESS_CHROME="http://localhost:${DOCKER_PORT}"
echo "Opening Chrome browser at ${ADDRESS_CHROME}"

# chromium --new-window http://sample.k3d.localhost:8080 &>/dev/null &
chrome -incognito ${ADDRESS_CHROME}