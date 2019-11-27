//
//  GameScene.swift
//  GameFlappy
//
//  Created by Yurii Denyshchenko on 11/27/19.
//  Copyright © 2019 Yurii Denyshchenko. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var backgroundNode : SKNode!
    var birdNode : SKSpriteNode!
    var gameOverLabelNode : SKLabelNode!
    
    override func didMove(to view: SKView) {
        backgroundNode = self.childNode(withName: "background")!
        birdNode = self.childNode(withName: "bird") as! SKSpriteNode
        gameOverLabelNode = self.childNode(withName: "gameOverLabel") as! SKLabelNode
        
        gameOverLabelNode.alpha = 0
        
        self.physicsWorld.contactDelegate = self
        
        let moveBackground = SKAction.move(by: CGVector(dx: -500, dy: 0), duration: 10)
        backgroundNode.run(moveBackground)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        birdNode.physicsBody!.applyImpulse(CGVector(dx: 0, dy: 15))
    }
    
    func stopGame(){
        backgroundNode.removeAllActions()
        birdNode.physicsBody!.pinned = true
        gameOverLabelNode.run(SKAction.fadeIn(withDuration: 0.5))
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        stopGame()
    }
}
