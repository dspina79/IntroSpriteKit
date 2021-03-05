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
        let colors: [UIColor] = [.red, .blue, .purple]
        let randomValue = Int.random(in: 20...40)
        let color = colors[randomValue % 3]
        let shape = SKSpriteNode(color: color, size: CGSize(width: randomValue, height: randomValue))
        shape.position = location
        
        if randomValue % 2 == 0 {
            shape.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: randomValue, height: randomValue))
        } else {
            shape.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(randomValue))
        }
        
        
        
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
