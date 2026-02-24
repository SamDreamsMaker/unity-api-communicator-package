# Editor API Communicator - Sample Scripts

This folder contains ready-to-use client examples for controlling Unity via the REST API.

## Available Examples

| Language | File | Requirements |
|----------|------|--------------|
| **Python** | `Python/unity_client.py` | `pip install requests` |
| **JavaScript** | `JavaScript/unity_client.js` | Node.js 18+ (or `npm install node-fetch`) |
| **PowerShell** | `PowerShell/unity_client.ps1` | Windows PowerShell 5+ |
| **Bash** | `Bash/unity_client.sh` | bash, curl |
| **C#** | `CSharp/UnityClient.cs` | .NET 6+ |

## Quick Start

1. **Open Unity** with the Editor API Communicator package installed
2. **Verify server is running**: Check `Tools > Editor API Communicator > Server Settings`
3. **Run any example**:

### Python
```bash
cd Samples~/Python
pip install requests
python unity_client.py
```

### JavaScript (Node.js)
```bash
cd Samples~/JavaScript
node unity_client.js
```

### PowerShell (Windows)
```powershell
cd Samples~\PowerShell
.\unity_client.ps1
```

### Bash (Linux/Mac)
```bash
cd Samples~/Bash
chmod +x unity_client.sh
./unity_client.sh
```

### C# (.NET)
```bash
cd Samples~/CSharp
dotnet new console
# Copy UnityClient.cs content into Program.cs
dotnet run
```

## What the Examples Do

Each example:
1. Checks connection to Unity
2. Creates a ground plane
3. Creates multiple colored primitives
4. Creates a directional light
5. Focuses the scene view on an object

## Customization

All examples use `http://localhost:7777` by default. To change:
- Modify the `BASE_URL` or `baseUrl` variable in any script
- Or change the server settings in Unity: `Tools > Editor API Communicator > Server Settings`

## API Reference

See the full API documentation at:
- `Documentation~/manual.md` - Complete endpoint reference
- `README.md` - Quick start guide
