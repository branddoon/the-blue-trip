//
//  GameScene+Collisions.swift
//  The blue trip
//
//  Created by Brandon Grande on 01/06/2025.
//

import SpriteKit

extension GameScene {
    
    func enemyDidCollideWithPlayer(_ enemy: SKSpriteNode, _ player: SKSpriteNode) {
        enemyAndPlayer(enemy, player)
    }

    func playerDidCollideWithEnemy(_ player: SKSpriteNode, _ enemy: SKSpriteNode) {
        enemyAndPlayer(enemy, player)
    }

    fileprivate func playerShotAndEnemy(_ enemy: SKSpriteNode, _ playerProjectile: SKSpriteNode) {
        let explosion = Explosion(size: enemy.size)
        switch enemy.name {
            case Nodes.coin.rawValue:
                coinsObtained += 1

                explosion.explosion(texture: Constants.Textures.explosion,
                                    music: Constants.Music.enemyExplosion,
                                    in: enemy.position)
            case Nodes.enemy.rawValue:
                coinsObtained += 2

                explosion.explosion(texture: Constants.Textures.enemyExplosion,
                                    music: Constants.Music.enemyExplosion,
                                    in: enemy.position)
            default:
                break
        }
        addChild(explosion)
        enemy.removeFromParent()
        playerProjectile.removeFromParent()
    }

    fileprivate func enemyAndPlayer(_ enemy: SKSpriteNode, _ player: SKSpriteNode) {
        let enemyExplosion = Explosion(size: enemy.size)
        switch enemy.name {
            case Nodes.coin.rawValue:
                coinsObtained += 1
                enemyExplosion.explosion(texture: Constants.Textures.coinDisappear,
                                         music: Constants.Music.enemyExplosion,
                                         in: enemy.position)
                addChild(enemyExplosion)
                enemy.removeFromParent()
            case Nodes.enemy.rawValue:
                enemyExplosion.explosion(texture: Constants.Textures.enemyExplosion,
                                         music: Constants.Music.enemyExplosion,
                                         in: enemy.position)
                let playerExplosion = Explosion(size: player.size)
                playerExplosion.explosion(texture: Constants.Textures.playerExplosion,
                                          music: Constants.Music.playerExplosion,
                                          in: player.position) {
                    self.endGame(isWin: false)
                }
                addChild(enemyExplosion)
                addChild(playerExplosion)
                enemy.removeFromParent()
                player.removeFromParent()
            default:
                break
        }

    }

    fileprivate func playerAndEnemyShot(_ player: SKSpriteNode, _ enemyProjectile: SKSpriteNode) {
        let explosion = Explosion(size: player.size)
        explosion.explosion(texture: Constants.Textures.playerExplosion, 
                            music: Constants.Music.playerExplosion,
                            in: player.position) {
            self.endGame(isWin: false)
        }
        addChild(explosion)
        player.removeFromParent()
        enemyProjectile.removeFromParent()
    }
}
