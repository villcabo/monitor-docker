#!/bin/bash

# Configuration
PROMETHEUS_HOST="localhost"
PROMETHEUS_PORT="9090"
RELOAD_ENDPOINT="/-/reload"
MAX_RETRIES=3
RETRY_DELAY=2

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to check if Prometheus is running
check_prometheus() {
    if ! curl --silent --head "http://${PROMETHEUS_HOST}:${PROMETHEUS_PORT}" > /dev/null; then
        echo -e "${RED}Error: Prometheus is not running at http://${PROMETHEUS_HOST}:${PROMETHEUS_PORT}${NC}"
        exit 1
    fi
}

# Function to reload Prometheus
reload_prometheus() {
    local attempt=1
    local reload_url="http://${PROMETHEUS_HOST}:${PROMETHEUS_PORT}${RELOAD_ENDPOINT}"

    while [ $attempt -le $MAX_RETRIES ]; do
        echo -e "${YELLOW}Attempting to reload Prometheus (attempt ${attempt}/${MAX_RETRIES})...${NC}"

        response=$(curl -s -w "%{http_code}" -X POST "${reload_url}" -o /dev/null)

        if [ "$response" -eq 200 ]; then
            echo -e "${GREEN}Prometheus successfully reloaded! ✅${NC}"
            return 0
        else
            echo -e "${RED}Failed to reload Prometheus (HTTP ${response})${NC}"

            if [ $attempt -lt $MAX_RETRIES ]; then
                echo -e "${YELLOW}Retrying in ${RETRY_DELAY} seconds...${NC}"
                sleep $RETRY_DELAY
            fi
        fi

        ((attempt++))
    done

    echo -e "${RED}Failed to reload Prometheus after ${MAX_RETRIES} attempts${NC}"
    return 1
}

# Main execution
main() {
    # Check if running with root privileges when needed
    if [ "$EUID" -eq 0 ]; then
        echo -e "${YELLOW}Warning: Running with root privileges${NC}"
    fi

    # Check if Prometheus is running
    check_prometheus

    # Attempt to reload Prometheus
    reload_prometheus
}

# Execute main function
main