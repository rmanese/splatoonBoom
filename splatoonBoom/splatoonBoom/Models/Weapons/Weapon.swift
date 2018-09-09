//
//  Weapon.swift
//  splatoonBoom
//
//  Created by Roberto Manese III on 9/4/18.
//  Copyright © 2018 jawnyawn. All rights reserved.
//

import Foundation

enum WeaponType {
    case Blaster, Brella, Brush, Charger, Dualies, Roller, Shooter, Slosher, Splattling
}

class Weapon {
    var streak: Int = 0
    var specials: Int = 0
    var mostSpecials: Int = 0
    var wins: Int = 0
    var totalGames: Int = 0
    var losses: Int = 0
    var ratioWL: Double = 0.00
    var kills: Int = 0
    var mostKills: Int = 0
    var games: [Game] = []
}
