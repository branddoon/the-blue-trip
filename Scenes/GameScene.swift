//
//  GameScene.swift
//  The blue trip
//
//  Created by Brandon Grande on 01/06/2025.
//

import SpriteKit
import GameplayKit

final class GameScene: ParentScene {
    
    private struct SceneTraits {
        static let animation: CGFloat = 0.25
    }
    
    var player = Player()
    var joystickIsActive = false
    var selectedNodes: [UITouch: SKSpriteNode] = [:]
    var playerVelocityX: CGFloat = 0
    var playerVelocityY: CGFloat = 0
    var coinsObtained: Int = 0 {
        didSet {
            ScoreManager.saveScore(coinsObtained)
            scoreLabel.text = String(format: NSLocalizedString("score.text", comment: ""), String(ScoreManager.getScore()))
            if (ScoreManager.getScore() >= 10){
                endGame(isWin: true)
            }
        }
    }
    var bossIsCreate = false
    let joystickBase = SKSpriteNode(imageNamed: Constants.Images.joystickBase)
    let joystick = SKSpriteNode(imageNamed: Constants.Images.joystick)
    let firePad = SKSpriteNode(imageNamed: Constants.Images.firePad)
    
    override func didMove(to view: SKView) {
        createParallaxBackground()
        createPlayerControls()
        createPlayer()
        createScoreLabel()
        addCoins()
        addEnemies()
        setupPhysics()
    }
    
    override func update(_ currentTime: TimeInterval) {
        if joystickIsActive {
            player.position = CGPointMake(player.position.x + (playerVelocityX * 3),
                                          player.position.y + (playerVelocityY * 3))
        }
    }

    func endGame(isWin: Bool) {
        let transition = SKTransition.crossFade(withDuration: SceneTraits.animation)
        let gameOverScene = GameOverScene(size: self.size, win: isWin)
        view?.presentScene(gameOverScene, transition: transition)
    }

    private func setupPhysics() {
        physicsWorld.gravity = .zero
        physicsWorld.contactDelegate = self
        physicsBody = SKPhysicsBody(edgeLoopFrom: CGRectMake(CGRectGetMinX(frame),
                                                             CGRectGetMinY(frame),
                                                             frame.size.width,
                                                             frame.size.height))
    }

    private func addCoins() {
        run(SKAction.repeatForever(
            SKAction.sequence([
                SKAction.run(createCoin),
                SKAction.wait(forDuration: CGFloat.random(in: 3...5))
            ])))
    }

    private func addEnemies() {
        run(SKAction.repeatForever(
            SKAction.sequence([
                SKAction.run(createEnemy),
                SKAction.wait(forDuration: CGFloat.random(in: 2...4))
            ])))
    }
}
