//
//  GameViewController.swift
//  The blue trip
//
// Created by Brandon Grande on 01/06/2025.
//

import UIKit
import SpriteKit
import GameplayKit

final class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let view = self.view as! SKView? {
            let scene = MainMenuScene(size: view.bounds.size)
            view.ignoresSiblingOrder = true
            view.isMultipleTouchEnabled = true
            view.showsFPS = false
            view.showsNodeCount = false
            view.presentScene(scene)
        }
    }

    override var prefersStatusBarHidden: Bool {
        true
    }
    
}
