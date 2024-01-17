#!/bin/bash
 
GRAPHQL_ENDPOINT=${GRAPHQL_ENDPOINT:-"http://127.0.0.1:8000"}
GRAPHQL_WS_ENDPOINT=${GRAPHQL_WS_ENDPOINT:-"ws://127.0.0.1:8000"}

echo "configuring server url to $GRAPHQL_ENDPOINT, $GRAPHQL_WS_ENDPOINT"

assets_dir="/usr/share/nginx/html/assets"

find "$assets_dir" -type f -exec sed -i "s|http://127.0.0.1:8000|$GRAPHQL_ENDPOINT|g; s|ws://127.0.0.1:8000|$GRAPHQL_WS_ENDPOINT|g" {} +

nginx -g "daemon off;"



