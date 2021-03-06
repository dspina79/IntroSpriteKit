//
//  ContentView.swift
//  IntroSpriteKit
//
//  Created by Dave Spina on 3/4/21.
//
import SpriteKit
import SwiftUI

class GameScene: SKScene {
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let balls: [String] = ["ballBlue", "ballRed", "ballYellow"]
        let shape = SKSpriteNode(imageNamed: balls.randomElement()!)
        shape.position = location
        shape.physicsBody = SKPhysicsBody(circleOfRadius: shape.frame.width / 2)
        shape.physicsBody?.allowsRotation = false
        shape.physicsBody?.mass = 10
        addChild(shape)
    }
}

struct ContentView: View {
    var scene: SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: 300, height: 350)
        scene.scaleMode = .fill
        return scene
    }
    
    var body: some View {
        SpriteView(scene: scene)
            .frame(width: 300, height: 350)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
