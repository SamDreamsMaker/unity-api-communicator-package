/**
 * Editor API Communicator - Node.js Client Example
 * ========================================
 * 
 * Prerequisites:
 *     npm install node-fetch (or use built-in fetch in Node 18+)
 * 
 * Usage:
 *     1. Open Unity with the Editor API Communicator package installed
 *     2. Run: node unity_client.js
 */

const BASE_URL = 'http://localhost:7777';

class UnityClient {
    constructor(baseUrl = BASE_URL) {
        this.baseUrl = baseUrl;
    }

    async request(method, endpoint, data = null) {
        const url = `${this.baseUrl}${endpoint}`;
        const options = {
            method,
            headers: { 'Content-Type': 'application/json' }
        };

        if (data && method !== 'GET') {
            options.body = JSON.stringify(data);
        }

        try {
            const response = await fetch(url, options);
            return await response.json();
        } catch (error) {
            return { success: false, error: `Cannot connect to Unity: ${error.message}` };
        }
    }

    // Core
    async status() {
        return this.request('GET', '/api/status');
    }

    async projectInfo() {
        return this.request('GET', '/api/project/info');
    }

    // GameObjects
    async createGameObject(name, primitiveType = 'Cube', x = 0, y = 0, z = 0) {
        return this.request('POST', '/api/gameobject/create', {
            name, primitiveType, x, y, z
        });
    }

    async deleteGameObject(name) {
        return this.request('POST', '/api/gameobject/delete', { name });
    }

    async transform(name, options = {}) {
        return this.request('POST', '/api/gameobject/transform', { name, ...options });
    }

    async listGameObjects() {
        return this.request('GET', '/api/gameobject/list');
    }

    // Materials
    async setColor(gameObjectName, r, g, b, a = 1) {
        return this.request('POST', '/api/material/color', {
            gameObjectName, r, g, b, a
        });
    }

    // Lights
    async createLight(name, type = 'Point', x = 0, y = 3, z = 0) {
        return this.request('POST', '/api/light/create', {
            name, type, x, y, z
        });
    }

    // Camera
    async screenshot(path, width = 1920, height = 1080) {
        return this.request('POST', '/api/camera/screenshot', {
            cameraName: 'Main Camera',
            path, width, height
        });
    }

    // Selection
    async select(name) {
        return this.request('POST', '/api/selection/gameobject', { name });
    }

    async focusSelected() {
        return this.request('POST', '/api/selection/focus');
    }

    // Scene
    async play() {
        return this.request('POST', '/api/scene/play');
    }

    async stop() {
        return this.request('POST', '/api/scene/stop');
    }
}

// Example usage
async function main() {
    const unity = new UnityClient();

    console.log('Checking Unity connection...');
    const status = await unity.status();

    if (!status.success) {
        console.error(`Error: ${status.error}`);
        process.exit(1);
    }
    console.log('Connected to Unity!');

    console.log('\n--- Creating Scene ---');

    // Create ground
    let result = await unity.createGameObject('Ground', 'Cube', 0, -0.5, 0);
    console.log(`Created Ground: ${result.success}`);
    await unity.transform('Ground', { scaleX: 10, scaleY: 0.1, scaleZ: 10 });
    await unity.setColor('Ground', 0.3, 0.3, 0.3);

    // Create spheres in a circle
    const count = 8;
    for (let i = 0; i < count; i++) {
        const angle = (i / count) * Math.PI * 2;
        const x = Math.cos(angle) * 3;
        const z = Math.sin(angle) * 3;
        const name = `Sphere_${i}`;

        result = await unity.createGameObject(name, 'Sphere', x, 0.5, z);
        console.log(`Created ${name}: ${result.success}`);

        // Rainbow colors
        const hue = i / count;
        await unity.setColor(name,
            Math.sin(hue * 6.28) * 0.5 + 0.5,
            Math.sin(hue * 6.28 + 2.09) * 0.5 + 0.5,
            Math.sin(hue * 6.28 + 4.18) * 0.5 + 0.5
        );
    }

    // Create a light
    await unity.createLight('MainLight', 'Directional', 0, 10, 0);
    console.log('Created light');

    // Focus on scene
    await unity.select('Sphere_0');
    await unity.focusSelected();

    console.log('\n--- Scene created! Check Unity. ---');
}

main().catch(console.error);
