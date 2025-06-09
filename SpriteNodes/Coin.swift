//
//  Coin.swift
//  The blue trip
//
// Created by Brandon Grande on 01/06/2025.
//

import SpriteKit

final class Coin: SKSpriteNode {
    
    init(texture: SKTexture, position: CGPoint) {
        super.init(texture: texture, color: .clear, size: texture.size())
        setup(with: position)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(with position: CGPoint) {
        zPosition = 1
        self.position = position
        physicsBody = SKPhysicsBody(rectangleOf: size)
        physicsBody?.isDynamic = true
        physicsBody?.categoryBitMask = PhysicsCategory.enemy
        physicsBody?.collisionBitMask = PhysicsCategory.none
        physicsBody?.usesPreciseCollisionDetection = true
    }
    
    func movement() {
        let duration = CGFloat.random(in: 3...6)
        let moveAction = SKAction.moveTo(x: -size.width / 2, duration: duration)
        let removeAction = SKAction.removeFromParent()
        let sequence = SKAction.sequence([moveAction, removeAction])
        run(sequence)
    }
}
