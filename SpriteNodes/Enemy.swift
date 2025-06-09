//
//  Enemy.swift
//  The blue trip
//
// Created by Brandon Grande on 01/06/2025.
//

import SpriteKit

class Enemy: SKSpriteNode {
     
    init() {
        super.init(texture: nil, color: .clear, size: .zero)
    }

    init(texture: SKTexture) {
        super.init(texture: texture, color: .clear, size: texture.size())
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func movement() {
        let duration = CGFloat.random(in: 3...6)
        let moveAction = SKAction.moveTo(x: -size.width / 2, duration: duration)
        let removeAction = SKAction.removeFromParent()
        let sequence = SKAction.sequence([moveAction, removeAction])
        run(sequence)
    }
    
    private func setup() {
        zPosition = 1
        physicsBody = SKPhysicsBody(rectangleOf: size)
        physicsBody?.categoryBitMask = PhysicsCategory.enemy
        physicsBody?.contactTestBitMask = PhysicsCategory.player
        physicsBody?.collisionBitMask = PhysicsCategory.none
        physicsBody?.usesPreciseCollisionDetection = true
    }
}
