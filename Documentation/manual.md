# Unity API Communicator - Complete Documentation

## Overview

Unity API Communicator is a professional Unity Editor extension that exposes **200+ REST endpoints** for complete Unity Editor control from any HTTP client. Whether you're building AI integrations, automation scripts, CI/CD pipelines, or custom tools, this API provides programmatic access to every aspect of Unity Editor.

## Use Cases

### 🤖 AI Agents
Integrate with Claude, ChatGPT, Copilot, or any AI system to automatically:
- Generate game scenes from descriptions
- Create and configure GameObjects
- Build entire game environments

### 🐍 Python Scripts
Automate workflows with Python:
```python
import requests

# Create 100 trees procedurally
for i in range(100):
    requests.post('http://localhost:7777/api/prefab/instantiate', json={
        'prefabPath': 'Assets/Prefabs/Tree.prefab',
        'x': random.uniform(-50, 50),
        'z': random.uniform(-50, 50)
    })
```

### 🔄 CI/CD Pipelines
Use in Jenkins, GitHub Actions, or GitLab CI:
```yaml
- name: Build Game
  run: |
    curl -X POST http://localhost:7777/api/build/start \
      -d '{"target": "StandaloneWindows64", "path": "./Builds/game.exe"}'
```

### 🌐 Web Dashboards
Build custom control panels with React, Vue, or any web framework to control Unity remotely.

### 🔧 External Tool Integration
Connect Unity with Blender, Maya, Figma, or any tool that can make HTTP requests.

### ✅ Automated Testing
Write E2E tests for your scenes:
```python
# Verify scene setup
response = requests.get('http://localhost:7777/api/gameobject/list')
assert 'Player' in [go['name'] for go in response.json()['data']['gameObjects']]
```

## Installation

1. In Unity, open **Window > Package Manager**
2. Click **+** > **Add package from disk...**
3. Select the `package.json` file from the package folder
4. The server starts automatically on port 7777

## Configuration

The default port is **7777**. To change it, edit the port constant in `HTTPServer.cs`.

## Response Format

All responses are JSON:

```json
{
  "success": true,
  "data": { ... }
}
```

On error:

```json
{
  "success": false,
  "error": "Error message"
}
```

---

## Complete API Reference

### 🔧 Core

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/status` | GET | Server status |
| `/api/project/info` | GET | Project information |
| `/api/scenes` | GET | List scenes |
| `/api/scene/play` | POST | Start Play Mode |
| `/api/scene/stop` | POST | Stop Play Mode |

---

### 🎮 GameObjects

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/gameobject/create` | POST | Create a GameObject |
| `/api/gameobject/delete` | POST | Delete |
| `/api/gameobject/transform` | POST | Modify transform |
| `/api/gameobject/component/add` | POST | Add component |
| `/api/gameobject/component/remove` | POST | Remove component |
| `/api/gameobject/hierarchy` | POST | Modify parent |
| `/api/gameobject/material` | POST | Assign material |
| `/api/gameobject/active` | POST | Enable/Disable |
| `/api/gameobject/clone` | POST | Clone |
| `/api/gameobject/tag` | POST | Modify tag |
| `/api/gameobject/layer` | POST | Modify layer |
| `/api/gameobject/list` | GET | List all |
| `/api/gameobject/findByTag/{tag}` | GET | Find by tag |
| `/api/gameobject/components/{name}` | GET | List components |

**Example - Create GameObject:**
```json
POST /api/gameobject/create
{
  "name": "MyCube",
  "primitiveType": "Cube",
  "x": 0, "y": 1, "z": 0
}
```

---

### 📦 Assets

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/asset/create` | POST | Create asset |
| `/api/asset/delete` | POST | Delete |
| `/api/asset/rename` | POST | Rename |
| `/api/asset/move` | POST | Move |
| `/api/asset/list` | GET | List assets |

---

### 🎨 Materials

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/material/color` | POST | Modify color |
| `/api/material/float` | POST | Modify float |
| `/api/material/texture` | POST | Assign texture |
| `/api/material/shader` | POST | Change shader |
| `/api/material/properties/{path}` | GET | List properties |

---

### 💡 Lights

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/light/create` | POST | Create light |
| `/api/light/configure` | POST | Configure |
| `/api/light/list` | GET | List lights |

---

### 📷 Cameras

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/camera/create` | POST | Create camera |
| `/api/camera/configure` | POST | Configure |
| `/api/camera/screenshot` | POST | Take screenshot |
| `/api/camera/list` | GET | List cameras |

---

### ⚙️ Physics

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/physics/rigidbody` | POST | Add/configure Rigidbody |
| `/api/physics/collider` | POST | Add collider |
| `/api/physics/joint` | POST | Add joint |
| `/api/physics/list` | GET | List Rigidbodies |

---

### 🔊 Audio

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/audio/source` | POST | Add AudioSource |
| `/api/audio/play` | POST | Play audio |
| `/api/audio/stop` | POST | Stop audio |
| `/api/audio/list` | GET | List sources |

---

### 🎬 Animation

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/animation/animator` | POST | Add Animator |
| `/api/animation/parameter` | POST | Modify parameter |
| `/api/animation/play` | POST | Play state |
| `/api/animation/clip` | POST | Create AnimationClip |
| `/api/animation/list` | GET | List animators |

---

### 🖼️ UI Canvas

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/ui/canvas` | POST | Create Canvas |
| `/api/ui/element` | POST | Create UI element |
| `/api/ui/configure` | POST | Configure element |
| `/api/ui/list` | GET | List Canvas |

**UI Element Types:** Button, Text, Image, Panel, InputField, Slider, Toggle, Dropdown

---

### ✨ Particles

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/particle/create` | POST | Create ParticleSystem |
| `/api/particle/configure` | POST | Configure |
| `/api/particle/play` | POST | Play |
| `/api/particle/stop` | POST | Stop |
| `/api/particle/list` | GET | List |

---

### 🧭 Navigation

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/nav/agent` | POST | Add NavMeshAgent |
| `/api/nav/obstacle` | POST | Add NavMeshObstacle |
| `/api/nav/destination` | POST | Set destination |
| `/api/nav/bake` | POST | Bake NavMesh |
| `/api/nav/agents` | GET | List agents |

---

### 🏔️ Terrain

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/terrain/create` | POST | Create terrain |
| `/api/terrain/height` | POST | Modify height |
| `/api/terrain/list` | GET | List terrains |

---

### 🔨 Build

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/build/settings` | GET | Get settings |
| `/api/build/player` | POST | Configure Player Settings |
| `/api/build/platform` | POST | Switch platform |
| `/api/build/start` | POST | Start build |
| `/api/build/platforms` | GET | Available platforms |

---

### 📦 Prefabs

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/prefab/create` | POST | Create prefab from GO |
| `/api/prefab/instantiate` | POST | Instantiate prefab |
| `/api/prefab/apply` | POST | Apply overrides |
| `/api/prefab/unpack` | POST | Unpack instance |
| `/api/prefab/list` | GET | List prefabs |

---

### 📝 Scripts

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/script/create` | POST | Create C# script |
| `/api/script/update` | POST | Modify content |
| `/api/script/content/{path}` | GET | Read content |
| `/api/script/list` | GET | List scripts |

---

### 📋 Console

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/console/listen/start` | POST | Start listening |
| `/api/console/listen/stop` | POST | Stop listening |
| `/api/console/logs` | GET | Get logs |
| `/api/console/clear` | POST | Clear console |
| `/api/console/log` | POST | Log message |
| `/api/console/count` | GET | Count errors |

---

### 🎯 Selection

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/selection` | GET | Get selection |
| `/api/selection/gameobject` | POST | Select GO |
| `/api/selection/asset` | POST | Select asset |
| `/api/selection/clear` | POST | Clear selection |
| `/api/selection/all` | POST | Select all |
| `/api/selection/focus` | POST | Focus in SceneView |

---

### ↩️ Undo/Redo

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/undo` | POST | Undo |
| `/api/undo/redo` | POST | Redo |
| `/api/undo/group/start` | POST | Start group |
| `/api/undo/group/collapse` | POST | Collapse group |
| `/api/undo/clear` | POST | Clear history |
| `/api/undo/register` | POST | Register object |

---

### 🎥 Scene View

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/sceneview` | GET | Editor camera info |
| `/api/sceneview/camera` | POST | Position/rotation |
| `/api/sceneview/lookat` | POST | Look at position |
| `/api/sceneview/2d` | POST | 2D mode on/off |
| `/api/sceneview/gizmos` | POST | Toggle gizmos |
| `/api/sceneview/align` | POST | Align to selection |

---

### 📁 Scenes (Advanced)

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/scene/active` | GET | Active scene info |
| `/api/scene/create` | POST | Create scene |
| `/api/scene/save` | POST | Save |
| `/api/scene/open` | POST | Open scene |
| `/api/scene/close` | POST | Close scene |
| `/api/scene/loaded` | GET | Loaded scenes |
| `/api/scene/setactive` | POST | Change active |

---

### 🌳 Hierarchy

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/hierarchy/info/{name}` | GET | Hierarchy info |
| `/api/hierarchy/sibling` | POST | Change order |
| `/api/hierarchy/rename` | POST | Rename |
| `/api/hierarchy/duplicate` | POST | Duplicate |
| `/api/hierarchy/child` | POST | Create child |
| `/api/hierarchy/sort` | POST | Sort children |

---

### 🌅 Render Settings

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/render/settings` | GET | All settings |
| `/api/render/ambient` | POST | Ambient lighting |
| `/api/render/fog` | POST | Fog |
| `/api/render/skybox` | POST | Change skybox |
| `/api/render/sun` | POST | Sun source |
| `/api/render/reflection` | POST | Reflections |

---

### 🏷️ Tags & Layers

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/tags` | GET | List tags |
| `/api/tags/add` | POST | Add tag |
| `/api/layers` | GET | List layers |
| `/api/layers/add` | POST | Add layer |
| `/api/layers/sorting` | GET | Sorting layers |

---

### ⚙️ Project Settings

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/settings/time` | GET/POST | Time settings |
| `/api/settings/physics` | GET/POST | Physics settings |
| `/api/settings/quality` | GET/POST | Quality settings |
| `/api/settings/audio` | GET | Audio settings |

---

### 🪟 Editor Windows

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/window/open` | POST | Open window |
| `/api/window/list` | GET | Available windows |
| `/api/window/close` | POST | Close window |
| `/api/window/maximize` | POST | Maximize Game View |

**Available Windows:** inspector, project, hierarchy, console, scene, game, animation, animator, profiler, lighting, navigation, occlusion

---

### 🔍 Search

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/search/assets` | POST | Search assets |
| `/api/search/gameobjects` | POST | Search GOs |
| `/api/search/component/{type}` | GET | By component |
| `/api/search/references` | POST | Find references |

---

### 📥 Import Settings

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/import/texture/{path}` | GET | Texture config |
| `/api/import/texture` | POST | Modify config |
| `/api/import/model/{path}` | GET | Model config |
| `/api/import/model` | POST | Modify config |
| `/api/import/audio/{path}` | GET | Audio config |

---

### 🔧 Universal Property Access

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/property/get` | POST | Read property |
| `/api/property/set` | POST | Write property |
| `/api/object/describe` | POST | Describe object |
| `/api/type/describe/{type}` | GET | Describe type |

**Example - Universal access:**
```json
POST /api/property/set
{
  "gameObjectName": "Player",
  "componentType": "Transform",
  "propertyPath": "position.x",
  "value": "10.5"
}
```

---

### 🔄 Editor Utilities

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/editor/refresh` | POST | Refresh assets |
| `/api/editor/recompile` | POST | Recompile scripts |
| `/api/editor/save` | POST | Save project |

---

## Statistics

- **200+ endpoints**
- **28 routers**
- **29 handlers**
- **~15,000 lines of code**
- **30+ domains covered**

## Support

For questions or issues, visit: https://unity-api-communicator.com
Email: support@unity-api-communicator.com
