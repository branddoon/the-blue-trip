//
//  GameScene+Delegates.swift
//  The blue trip
//
// Created by Brandon Grande on 01/06/2025.
//

import SpriteKit

extension GameScene: SKPhysicsContactDelegate {
    
    func didBegin(_ contact: SKPhysicsContact) {
        let firstBody = contact.bodyA
        let secondBody = contact.bodyB

        if firstBody.categoryBitMask == PhysicsCategory.enemy && secondBody.categoryBitMask == PhysicsCategory.player {
            if let enemy = firstBody.node as? SKSpriteNode,
               let player = secondBody.node as? SKSpriteNode {
                enemyDidCollideWithPlayer(enemy, player)
            }
        }

        if firstBody.categoryBitMask == PhysicsCategory.player && secondBody.categoryBitMask == PhysicsCategory.enemy {
            if let player = firstBody.node as? SKSpriteNode,
               let enemy = secondBody.node as? SKSpriteNode {
                playerDidCollideWithEnemy(player, enemy)
            }
        }
    }
    
}
