//
//  Constants.swift
//  The blue trip
//
//  Created by Brandon Grande on 01/06/2025.
//

import Foundation

enum Constants {
    struct Images {
        static let asteroid = "img_asteroids"
        static let background = "img_menu_background"
        static let backgroundGame = "img_background_game"
        static let boss = "img_boss"
        static let enemy = "img_enemy"
        static let enemyShot = "img_enemy_shot"
        static let joystickBase = "img_base_joystick"
        static let joystick = "img_joystick"
        static let firePad = "img_joystick"
        static let player = "img_ship"
        static let playerShot = "img_shot1_asset"
    }

    struct Keys {
        static let score = "score"
    }

    struct Music {
        static let enemyExplosion = "enemy-explosion.mp3"
        static let game = "space-game.mp3"
        static let menu = "menu.mp3"
        static let playerExplosion = "player-explosion.mp3"
        static let shot = "short-laser-gun-shot.mp3"
        static let startGame = "start-level.mp3"
    }

    struct Textures {
        static let bossExplosion = "BossExplosion"
        static let bossTurboEngine = "BossTurbo"
        static let enemyTurbo = "EnemyTurbo"
        static let enemyExplosion = "EnemyExplosion"
        static let explosion = "Explosion"
        static let coinDisappear = "CoinDisappear"
        static let playerExplosion = "PlayerExplosion"
        static let playerNormalFire = "PlayerNormal"
        static let playerTurboFire = "PlayerTurbo"
        static let texture = "texture_%d"
    }
}
