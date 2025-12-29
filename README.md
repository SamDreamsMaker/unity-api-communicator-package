# Unity API Communicator (UAC)

**Comprehensive HTTP REST API for Unity Editor Control**

A professional Unity Editor extension providing **205+ REST endpoints** for complete Unity Editor automation and control from any HTTP client.

[![Unity](https://img.shields.io/badge/Unity-6+-black.svg)](https://unity3d.com)
[![License](https://img.shields.io/badge/License-Commercial-blue.svg)](LICENSE.md)
[![Version](https://img.shields.io/badge/Version-1.2.2-green.svg)](CHANGELOG.md)
[![Website](https://img.shields.io/badge/Website-unity--api--communicator.com-6366f1.svg)](https://unity-api-communicator.com)
[![Docs](https://img.shields.io/badge/Docs-API%20Reference-10b981.svg)](https://unity-api-communicator.com/docs.html)

## Overview

Unity API Communicator (UAC) transforms Unity Editor into a fully controllable HTTP service. Whether you're building AI integrations, automation scripts, CI/CD pipelines, or custom tools, this API provides programmatic access to every aspect of Unity Editor.

## Key Features

- **205+ REST Endpoints** - Complete Unity Editor control
- **Zero Configuration** - Works out-of-the-box, auto-starts on Unity load
- **Configurable** - Easy settings via Inspector or Settings Window
- **Universal Compatibility** - Works with any HTTP client
- **Real-time Control** - Immediate response and execution
- **Thread-Safe** - Proper main thread execution for Unity operations
- **Modular Architecture** - 28 specialized routers, 29 handlers
- **Visual Testing** - Screenshot capture of Editor and Game views
- **AI-Ready** - Auto-discovery endpoints for AI agents

## Use Cases

| Client | Use Case |
|--------|----------|
| **AI Agents** | Claude, ChatGPT, Copilot integration for automated scene generation |
| **Python Scripts** | Workflow automation, batch processing, procedural generation |
| **CI/CD Pipelines** | Jenkins, GitHub Actions for automated builds and testing |
| **Web Applications** | Custom dashboards, remote Unity control panels |
| **External Tools** | Integration with Blender, Maya, Figma |
| **Automated Testing** | E2E scene testing, visual regression testing |
| **Custom Editors** | Build your own Unity control interfaces |

## Installation

1. Open **Window > Package Manager** in Unity
2. Click **+** > **Add package from disk...**
3. Select `package.json` from the UAC folder
4. Server starts automatically (default: `http://localhost:7777`)

## Configuration

Open **Tools > Unity API Communicator > Server Settings** to configure:

| Setting | Default | Description |
|---------|---------|-------------|
| Host | localhost | Server address |
| Port | 7777 | Server port |
| Auto Start | true | Start on Unity load |
| Enable CORS | true | Allow browser requests |
| Log Requests | false | Debug logging |

## Quick Start

### Check Server Status
```bash
curl http://localhost:7777/api/status
```

### Create a GameObject
```bash
curl -X POST http://localhost:7777/api/gameobject/create \
  -H "Content-Type: application/json" \
  -d '{"name": "MyCube", "type": "Cube"}'
```

### Discover All Endpoints
```bash
curl http://localhost:7777/api/discover
```

## AI Agent Integration

This API is designed to work seamlessly with AI agents (Claude, ChatGPT, Copilot, etc.).

### Auto-Discovery

AI agents can discover all available endpoints programmatically:

```bash
# List all endpoints
curl http://localhost:7777/api/discover

# List categories
curl http://localhost:7777/api/categories

# Get help for specific endpoint
curl -X POST http://localhost:7777/api/help -d '{"path":"/api/gameobject/create"}'
```

### Quick Reference for AI

```
Server: http://localhost:7777
Discovery: GET /api/discover
Categories: GET /api/categories

Common endpoints:
- POST /api/gameobject/create - Create objects
- POST /api/terrain/create - Create terrain
- POST /api/scene/new - New scene
- GET /api/scene/list - List scenes
- POST /api/editor/play - Enter play mode
```

## API Categories

### GameObjects (12 endpoints)
- Create, transform, clone, delete, find, components

### Assets (4 endpoints)
- Create, delete, rename, move assets

### Materials (5 endpoints)
- Colors, floats, textures, shaders, **variants**

### Prefabs (6 endpoints)
- Create, instantiate, apply, unpack, list, **variants**

### Components (15 endpoints)
- Light, Camera, Physics (Rigidbody, Colliders), Audio

### Animation (7 endpoints)
- Animators, controllers, states, clips

### UI (3 endpoints)
- Canvas, UI elements

### Particles (5 endpoints)
- Create, configure, play, stop

### Navigation (5 endpoints)
- NavMesh agents, obstacles, baking

### Terrain (17 endpoints)
- Create, heightmaps, layers, trees, grass, foliage

### Scenes (7 endpoints)
- Create, save, open, close, list

### Editor Control (7 endpoints)
- Play/Stop, refresh, recompile, screenshot

### Discovery (3 endpoints)
- Auto-discover endpoints, categories, help

### And more...
- Build, Scripts, Console, Selection, Undo, SceneView, Hierarchy, Render, Tags & Layers, Project Settings, Search, Import Settings, Packages, Profiler, Execute

## Statistics

- **205+ endpoints** (including discovery)
- **28 routers**
- **29 handlers**
- **~15,000 lines of code**
- **30+ domains covered**

## Security Note

By default, the server only accepts connections from localhost. To allow remote access, change the Host setting to `*` in Server Settings.

## Sample Scripts

Ready-to-use client examples are included in `Samples/`:
- **Python** - `unity_client.py`
- **Node.js** - `unity_client.js`
- **PowerShell** - `unity_client.ps1`
- **Bash** - `unity_client.sh`
- **C# .NET** - `UnityClient.cs`

## License

Commercial License - See [LICENSE.md](LICENSE.md)

## Documentation

See [Documentation](Documentation/manual.md) for complete API reference.


