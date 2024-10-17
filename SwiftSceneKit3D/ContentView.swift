//
//  ContentView.swift
//  SwiftSceneKit3D
//
//  Created by MacBook Pro M1 Pro on 10/17/24.
//

import SwiftUI
import SceneKit

// 1. Create a SceneKit view using UIViewRepresentable
struct SceneKitView: UIViewRepresentable {
    
    // Create the SCNView
    func makeUIView(context: Context) -> SCNView {
        let sceneView = SCNView()
        
        // Create a new scene
        let scene = SCNScene()
        
        // Create a cube node
        let cubeGeometry = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0)
        let cubeNode = SCNNode(geometry: cubeGeometry)
        
        // Position the cube node
        cubeNode.position = SCNVector3(0, 0, 0)
        
        // Add the cube node to the scene
        scene.rootNode.addChildNode(cubeNode)
        
        // Set up a camera
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 5)
        scene.rootNode.addChildNode(cameraNode)
        
        // Add a light to the scene
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = .omni
        lightNode.position = SCNVector3(x: 5, y: 5, z: 5)
        scene.rootNode.addChildNode(lightNode)
        
        // Add an ambient light to the scene
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light?.type = .ambient
        ambientLightNode.light?.intensity = 1000
        scene.rootNode.addChildNode(ambientLightNode)
        
        // Set the scene to the view
        sceneView.scene = scene
        
        // Allow user interaction (optional)
        sceneView.allowsCameraControl = true
        
        // Set the background color of the scene
        sceneView.backgroundColor = UIColor.black
        
        // Start rotating the cube
        let rotation = SCNAction.rotateBy(x: 0, y: 2 * .pi, z: 0, duration: 5)
        let repeatRotation = SCNAction.repeatForever(rotation)
        cubeNode.runAction(repeatRotation)
        
        return sceneView
    }
    
    // Update view
    func updateUIView(_ uiView: SCNView, context: Context) {
        // Leave empty, no updates needed for now
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("SceneKit in SwiftUI")
                .font(.largeTitle)
                .padding()

            // 2. Use the SceneKitView inside SwiftUI
            SceneKitView()
                .frame(height: 500)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

// Preview for SwiftUI
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
