# Changelog - Unity API Communicator

All notable changes to this package will be documented in this file.

## [1.2.1] - 2025-12-19

### Security Fix
- **CRITICAL**: Fixed license validation pointing to staging instead of production

---
## [1.2.0] - 2025-12-18

### Added - 16 New Endpoints (Phase 2)

**Addressables (5):** status, groups, entries, create, build
**Timeline (5):** status, list, create, tracks, addTrack  
**Audio Mixer (6):** list, groups, snapshots, parameter (get/set)

### Technical
- All optional package handlers use reflection for compatibility
- Works with or without Addressables/Timeline packages

---

## [1.1.0] - 2025-12-18

### Added - 11 New Endpoints

**Script Compilation:**
- `GET /api/script/errors` - Get compilation errors and warnings
- `POST /api/script/recompile` - Force script recompilation
- `GET /api/script/status` - Get compilation status

**Sprite Operations (2D):**
- `POST /api/sprite/slice` - Auto-slice sprite sheets (grid/automatic)
- `GET /api/sprite/info/{path}` - Get sprite metadata
- `GET /api/sprite/list` - List all sprites

**Tilemap Operations (2D):**
- `POST /api/tilemap/create` - Create tilemap with grid parent
- `POST /api/tilemap/paint` - Paint tiles at position
- `POST /api/tilemap/clear` - Clear all tiles
- `GET /api/tilemap/list` - List all tilemaps

### Technical
- Uses `ISpriteEditorDataProvider` for Unity 2021+ compatibility
- Uses `FindObjectsByType` for Unity 6+ compatibility
- New handlers: `SpriteHandler`, `TilemapHandler`
- New routers: `SpriteRouter`, `TilemapRouter`

---

## [1.0.10] - 2025-12-18

### Added
- **Prefab Variant endpoint** - `POST /api/prefab/variant` - Create prefab variants from existing prefabs
- **Material Variant endpoint** - `POST /api/material/variant` - Create material variants (Unity 2022+)

### Fixed
- **README encoding** - Fixed broken emoji characters displaying as "??"
- **Endpoint count** - Updated to reflect 180+ endpoints

---

## [1.0.9] - 2025-12-17

### Fixed
- **Console listener persistence** - Now survives recompilation using SessionState
- **HTTP Server port conflict** - Server properly stops before recompilation (AssemblyReloadEvents)
- **Website dates** - Updated from 2024 to 2025
- **Email link visibility** - Changed to light blue for better visibility on dark theme

---

## [1.0.8] - 2025-12-15

### ?? Release Highlights
- **Compiled DLL distribution** for enhanced license security
- **Unity 6 minimum version** requirement
- **Improved UX** for Pro/Studio subscription flow

### Added
- **Welcome Screen** - Shown on first install, adapts to license status
- **Website badges** in README with backlinks
- **2 new Lite endpoints** - `/api/gameobject/active`, `/api/gameobject/clone`

### Changed
- **LICENSE.md** - Updated branding to Unity API Communicator
- **README.md** - Fixed endpoint counts (200+), added website links
- **Package distribution** - Now uses compiled DLL instead of source code
- **Minimum Unity version** - Unity 6+ required

### Fixed
- Welcome splashscreen "Don't show again" checkbox logic
- ThreadAbortException error message during recompilation
- Removed unnecessary "No license found" log message

---

## [1.0.0] - 2025-12-14

### ?? Initial Release

Unity API Communicator is a professional Unity Editor extension providing **200+ REST endpoints** for complete Unity Editor control from any HTTP client.

#### Key Features
- **HTTP Server** for Unity Editor control (default port 7777)
- **Thread-safe** main thread execution
- **CORS support** for cross-origin requests
- **AI Discovery API** - /api/discover, /api/categories, /api/help
- **Offline licensing** with RSA verification

#### License Tiers
- **Lite (Free)** - 30+ endpoints for evaluation
- **Pro (�29.99/mo)** - All 200+ endpoints, commercial use
- **Studio (�99.99/mo)** - All endpoints + priority support

#### API Categories (200+ endpoints)
- **GameObjects** (12): Create, transform, clone, delete, components
- **Assets** (5): Create, delete, rename, move, list
- **Materials** (5): Colors, floats, textures, shaders
- **Components** (15): Light, Camera, Physics, Audio
- **Animation** (7): Animators, controllers, states, clips
- **UI** (4): Canvas, elements, configuration
- **Particles** (5): Create, configure, play, stop
- **Navigation** (5): NavMesh agents, obstacles, baking
- **Terrain** (17): Create, heightmaps, layers, trees, grass
- **Build** (5): Settings, platforms, builds
- **Prefabs** (5): Create, instantiate, apply, unpack
- **Scripts** (4): Create, update, list
- **Console** (6): Log listening, clear
- **Selection** (6): Get, set, clear, focus
- **Undo/Redo** (6): Full undo system support
- **Scene View** (6): Camera control, 2D mode, gizmos
- **Scenes** (7): Create, save, open, close
- **Hierarchy** (6): Reorder, rename, duplicate
- **Render Settings** (6): Ambient, fog, skybox
- **Tags & Layers** (5): Manage tags and layers
- **Project Settings** (7): Time, physics, quality, audio
- **Search** (4): Assets, GameObjects, references
- **Import Settings** (5): Texture, model, audio config
- **Property Access** (4): Reflection-based access
- **Editor Control** (7): Play/stop, refresh, screenshot
- **Discovery** (3): Auto-discover endpoints for AI
- **Execute** (6): Call methods via reflection
- **Package Manager** (4): List, install, remove packages
- **Profiler** (5): Performance monitoring

#### Architecture
- 28 modular routers
- 29 specialized handlers
- ~15,000 lines of code

#### Compatibility
- Unity 6 and newer
- Windows, macOS, Linux

## Support

Website: https://unity-api-communicator.com
Email: support@unity-api-communicator.com

