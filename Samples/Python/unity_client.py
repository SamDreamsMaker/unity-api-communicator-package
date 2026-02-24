"""
Editor API Communicator - Python Client Example
=======================================

Prerequisites:
    pip install requests

Usage:
    1. Open Unity with the Editor API Communicator package installed
    2. Run this script: python unity_client.py

"""

import requests
import json
import time

# Configuration
BASE_URL = "http://localhost:7777"

class UnityClient:
    """Simple Python client for Editor API Communicator"""
    
    def __init__(self, base_url=BASE_URL):
        self.base_url = base_url
    
    def _request(self, method, endpoint, data=None):
        """Make HTTP request to Unity API"""
        url = f"{self.base_url}{endpoint}"
        try:
            if method == "GET":
                response = requests.get(url)
            else:
                response = requests.post(url, json=data)
            return response.json()
        except requests.exceptions.ConnectionError:
            return {"success": False, "error": "Cannot connect to Unity. Is Unity running?"}
    
    # Core
    def status(self):
        return self._request("GET", "/api/status")
    
    def project_info(self):
        return self._request("GET", "/api/project/info")
    
    # GameObjects
    def create_gameobject(self, name, primitive_type="Cube", x=0, y=0, z=0):
        return self._request("POST", "/api/gameobject/create", {
            "name": name,
            "primitiveType": primitive_type,
            "x": x, "y": y, "z": z
        })
    
    def delete_gameobject(self, name):
        return self._request("POST", "/api/gameobject/delete", {"name": name})
    
    def transform(self, name, x=None, y=None, z=None, rx=None, ry=None, rz=None, sx=None, sy=None, sz=None):
        data = {"name": name}
        if x is not None: data["x"] = x
        if y is not None: data["y"] = y
        if z is not None: data["z"] = z
        if rx is not None: data["rotationX"] = rx
        if ry is not None: data["rotationY"] = ry
        if rz is not None: data["rotationZ"] = rz
        if sx is not None: data["scaleX"] = sx
        if sy is not None: data["scaleY"] = sy
        if sz is not None: data["scaleZ"] = sz
        return self._request("POST", "/api/gameobject/transform", data)
    
    def list_gameobjects(self):
        return self._request("GET", "/api/gameobject/list")
    
    # Materials
    def set_color(self, gameobject_name, r, g, b, a=1):
        return self._request("POST", "/api/material/color", {
            "gameObjectName": gameobject_name,
            "r": r, "g": g, "b": b, "a": a
        })
    
    # Lights
    def create_light(self, name, light_type="Point", x=0, y=3, z=0):
        return self._request("POST", "/api/light/create", {
            "name": name,
            "type": light_type,
            "x": x, "y": y, "z": z
        })
    
    # Camera
    def screenshot(self, path, width=1920, height=1080):
        return self._request("POST", "/api/camera/screenshot", {
            "cameraName": "Main Camera",
            "path": path,
            "width": width,
            "height": height
        })
    
    # Selection
    def select(self, name):
        return self._request("POST", "/api/selection/gameobject", {"name": name})
    
    def focus_selected(self):
        return self._request("POST", "/api/selection/focus")
    
    # Scene
    def play(self):
        return self._request("POST", "/api/scene/play")
    
    def stop(self):
        return self._request("POST", "/api/scene/stop")


# Example usage
if __name__ == "__main__":
    unity = UnityClient()
    
    # Check connection
    print("Checking Unity connection...")
    status = unity.status()
    if not status.get("success"):
        print(f"Error: {status.get('error')}")
        exit(1)
    print(f"Connected to Unity!")
    
    # Create a simple scene
    print("\n--- Creating Scene ---")
    
    # Create ground
    result = unity.create_gameobject("Ground", "Cube", 0, -0.5, 0)
    print(f"Created Ground: {result.get('success')}")
    unity.transform("Ground", sx=10, sy=0.1, sz=10)
    unity.set_color("Ground", 0.3, 0.3, 0.3)
    
    # Create some cubes
    for i in range(5):
        name = f"Cube_{i}"
        result = unity.create_gameobject(name, "Cube", i * 2 - 4, 0.5, 0)
        print(f"Created {name}: {result.get('success')}")
        
        # Random color
        import random
        unity.set_color(name, random.random(), random.random(), random.random())
    
    # Create a light
    unity.create_light("MainLight", "Directional", 0, 10, 0)
    print("Created light")
    
    # Focus on scene
    unity.select("Cube_2")
    unity.focus_selected()
    
    # Take screenshot
    result = unity.screenshot("Assets/Screenshots/scene.png")
    print(f"Screenshot: {result.get('success')}")
    
    print("\n--- Scene created! Check Unity. ---")
