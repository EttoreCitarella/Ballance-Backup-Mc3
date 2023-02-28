//
//  ContentView.swift
//  Test 17
//
//  Created by Ettore Citarella on 22/02/23.
//
import SwiftUI
import CoreMotion
import SpriteKit

class GameScene: SKScene {
    
    private let motionManager = CMMotionManager()
    
    let repetitionFactor: Double = 2.0

    override func didMove(to view: SKView) {
        motionManager.startAccelerometerUpdates()
        self.backgroundColor = .clear
        view.allowsTransparency = true
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        if let accelerometerData = motionManager.accelerometerData {
            physicsWorld.gravity = CGVector(dx: accelerometerData.acceleration.x * 9.8*2, dy: accelerometerData.acceleration.y * 9.8*2)
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        let location = touch.location(in: self)
        
        if (touch.tapCount <= 1) {
            let sprite2 = SKSpriteNode(imageNamed: "Beer")
            sprite2.size = CGSize(width: 50, height: 50)
            sprite2.physicsBody = SKPhysicsBody(texture: sprite2.texture!, size: CGSize(width: 50, height: 50))
            sprite2.position = location
            
           let sprite3 = SKSpriteNode(imageNamed: "Vine")
           sprite3.size = CGSize(width: 60, height: 60)
            sprite3.physicsBody = SKPhysicsBody(texture: sprite3.texture!, size: CGSize(width: 60, height: 60))
           sprite3.position = location
//
//            let sprite4 = SKSpriteNode(imageNamed: "t1")
//            sprite4.size = CGSize(width: 60, height: 60)
//            sprite4.physicsBody = SKPhysicsBody(texture: sprite4.texture!, size: CGSize(width: 60, height: 60))
//            sprite4.position = location
//
//            let sprite5 = SKSpriteNode(imageNamed: "t2")
//            sprite5.size = CGSize(width: 60, height: 60)
//            sprite5.physicsBody = SKPhysicsBody(texture: sprite5.texture!, size: CGSize(width: 60, height: 60))
//            sprite5.position = location
//
//            let sprite6 = SKSpriteNode(imageNamed: "e1")
//            sprite6.size = CGSize(width: 60, height: 60)
//            sprite6.physicsBody = SKPhysicsBody(texture: sprite6.texture!, size: CGSize(width: 60, height: 60))
//            sprite6.position = location
//
//            self.run(SKAction.sequence([SKAction.wait(forDuration: 0.2*repetitionFactor), SKAction.run({
//                self.addChild(sprite4)
//            })]))
//            self.run(SKAction.sequence([SKAction.wait(forDuration: 1.2*repetitionFactor), SKAction.run({
//                self.addChild(sprite5)
//            })]))
           self.run(SKAction.sequence([SKAction.wait(forDuration: 0.4*repetitionFactor), SKAction.run({
                self.addChild(sprite3)
           })]))
            self.run(SKAction.sequence([SKAction.wait(forDuration: 0.6*repetitionFactor), SKAction.run({
                self.addChild(sprite2)
            })]))
//            self.run(SKAction.sequence([SKAction.wait(forDuration: 0.8*repetitionFactor), SKAction.run({
//                self.addChild(sprite6)
//            })]))
        }
        
        if (touch.tapCount >= 1) {
            self.removeAllChildren()
        }
    }

}

struct ContentView: View {
    let screenWidth  = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    @StateObject private var model = FrameHandler()
    
    var scene: SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: screenWidth, height: screenHeight)
        scene.scaleMode = .fill
        return scene
    }
    
    var body: some View {
        ZStack{
//            Color(.red)
//                .ignoresSafeArea()
            
            FrameView(image: model.frame)
                .ignoresSafeArea()
            
//            Text("Hello")
            Tray()
            
            SpriteView(scene: scene, options: [.allowsTransparency])
                .frame(width: screenWidth, height: screenHeight)
                .ignoresSafeArea()
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
