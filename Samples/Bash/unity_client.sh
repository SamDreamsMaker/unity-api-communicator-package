#!/bin/bash
# Editor API Communicator - Bash/cURL Example
# ===================================
#
# Usage:
#     1. Open Unity with the Editor API Communicator package installed
#     2. Run: chmod +x unity_client.sh && ./unity_client.sh

BASE_URL="http://localhost:7777"

# Helper function
unity_api() {
    local method=$1
    local endpoint=$2
    local data=$3
    
    if [ "$method" = "GET" ]; then
        curl -s "${BASE_URL}${endpoint}"
    else
        curl -s -X POST "${BASE_URL}${endpoint}" \
            -H "Content-Type: application/json" \
            -d "$data"
    fi
}

echo "Checking Unity connection..."
status=$(unity_api GET "/api/status")
if echo "$status" | grep -q '"success":false'; then
    echo "Error: Cannot connect to Unity. Is Unity running?"
    exit 1
fi
echo "Connected to Unity!"

echo ""
echo "--- Creating Scene ---"

# Create ground
result=$(unity_api POST "/api/gameobject/create" '{"name":"Ground","primitiveType":"Cube","x":0,"y":-0.5,"z":0}')
echo "Created Ground"

unity_api POST "/api/gameobject/transform" '{"name":"Ground","scaleX":10,"scaleY":0.1,"scaleZ":10}' > /dev/null
unity_api POST "/api/material/color" '{"gameObjectName":"Ground","r":0.3,"g":0.3,"b":0.3,"a":1}' > /dev/null

# Create cubes
for i in {0..4}; do
    x=$((i * 2 - 4))
    name="Cube_$i"
    
    unity_api POST "/api/gameobject/create" "{\"name\":\"$name\",\"primitiveType\":\"Cube\",\"x\":$x,\"y\":0.5,\"z\":0}" > /dev/null
    echo "Created $name"
    
    # Random color (bash random is limited, using fixed colors)
    r=$(echo "scale=2; $i / 5" | bc)
    g=$(echo "scale=2; (5 - $i) / 5" | bc)
    b="0.5"
    unity_api POST "/api/material/color" "{\"gameObjectName\":\"$name\",\"r\":$r,\"g\":$g,\"b\":$b,\"a\":1}" > /dev/null
done

# Create light
unity_api POST "/api/light/create" '{"name":"MainLight","type":"Directional","x":0,"y":10,"z":0}' > /dev/null
echo "Created light"

# Focus
unity_api POST "/api/selection/gameobject" '{"name":"Cube_2"}' > /dev/null
unity_api POST "/api/selection/focus" > /dev/null

echo ""
echo "--- Scene created! Check Unity. ---"
