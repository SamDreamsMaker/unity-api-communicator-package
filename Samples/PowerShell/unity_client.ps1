# Editor API Communicator - PowerShell Client Example
# ===========================================
#
# Usage:
#     1. Open Unity with the Editor API Communicator package installed
#     2. Run: .\unity_client.ps1

$BaseUrl = "http://localhost:7777"

function Invoke-UnityAPI {
    param(
        [string]$Method = "GET",
        [string]$Endpoint,
        [hashtable]$Body = $null
    )
    
    $uri = "$BaseUrl$Endpoint"
    
    try {
        if ($Method -eq "GET") {
            $response = Invoke-RestMethod -Uri $uri -Method Get
        }
        else {
            $json = $Body | ConvertTo-Json -Depth 10
            $response = Invoke-RestMethod -Uri $uri -Method Post -Body $json -ContentType "application/json"
        }
        return $response
    }
    catch {
        Write-Host "Error: Cannot connect to Unity. Is Unity running?" -ForegroundColor Red
        return $null
    }
}

# Check connection
Write-Host "Checking Unity connection..." -ForegroundColor Cyan
$status = Invoke-UnityAPI -Endpoint "/api/status"
if (-not $status) { exit 1 }
Write-Host "Connected to Unity!" -ForegroundColor Green

Write-Host "`n--- Creating Scene ---" -ForegroundColor Yellow

# Create ground
$result = Invoke-UnityAPI -Method POST -Endpoint "/api/gameobject/create" -Body @{
    name = "Ground"
    primitiveType = "Cube"
    x = 0; y = -0.5; z = 0
}
Write-Host "Created Ground: $($result.success)"

Invoke-UnityAPI -Method POST -Endpoint "/api/gameobject/transform" -Body @{
    name = "Ground"
    scaleX = 10; scaleY = 0.1; scaleZ = 10
}

Invoke-UnityAPI -Method POST -Endpoint "/api/material/color" -Body @{
    gameObjectName = "Ground"
    r = 0.3; g = 0.3; b = 0.3; a = 1
}

# Create cubes in a row
for ($i = 0; $i -lt 5; $i++) {
    $name = "Cube_$i"
    $x = $i * 2 - 4
    
    $result = Invoke-UnityAPI -Method POST -Endpoint "/api/gameobject/create" -Body @{
        name = $name
        primitiveType = "Cube"
        x = $x; y = 0.5; z = 0
    }
    Write-Host "Created $name`: $($result.success)"
    
    # Random color
    Invoke-UnityAPI -Method POST -Endpoint "/api/material/color" -Body @{
        gameObjectName = $name
        r              = (Get-Random -Minimum 0.0 -Maximum 1.0)
        g              = (Get-Random -Minimum 0.0 -Maximum 1.0)
        b              = (Get-Random -Minimum 0.0 -Maximum 1.0)
        a              = 1
    }
}

# Create light
Invoke-UnityAPI -Method POST -Endpoint "/api/light/create" -Body @{
    name = "MainLight"
    type = "Directional"
    x = 0; y = 10; z = 0
}
Write-Host "Created light"

# Focus on a cube
Invoke-UnityAPI -Method POST -Endpoint "/api/selection/gameobject" -Body @{ name = "Cube_2" }
Invoke-UnityAPI -Method POST -Endpoint "/api/selection/focus"

Write-Host "`n--- Scene created! Check Unity. ---" -ForegroundColor Green
