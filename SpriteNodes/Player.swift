//
//  Player.swift
//  The blue trip
//
//  Created by Brandon Grande on 01/06/2025.
//

import SpriteKit

final class Player: SKSpriteNode {

    init() {
        super.init(texture: nil, color: .clear, size: .zero)
    }

    init(texture: SKTexture, size: CGSize, position: CGPoint) {
        super.init(texture: texture, color: .clear, size: size)
        setup(with: position)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(with position: CGPoint) {
        zPosition = 1
        self.position = position
    }
    
    func shot(){
        
    }
}
