//
//  ParentScene.swift
//  The blue trip
//
// Created by Brandon Grande on 01/06/2025.
//

import SpriteKit

class ParentScene: SKScene {
    var scoreLabel = SKLabelNode(text: "")
    func createScoreLabel() {
        let score = String(0)
        scoreLabel.zPosition = 6
        scoreLabel.fontSize = CGFloat(40)
        scoreLabel.text = String(format: NSLocalizedString("score.text", comment: ""), score)
        scoreLabel.horizontalAlignmentMode = .right
        scoreLabel.verticalAlignmentMode = .top
        scoreLabel.position = CGPoint(x: size.width - 35, y: size.height - 15)
        addChild(scoreLabel)
    }
}
