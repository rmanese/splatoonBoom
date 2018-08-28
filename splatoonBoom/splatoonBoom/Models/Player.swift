//
//  Player.swift
//  splatoonBoom
//
//  Created by Roberto Manese III on 8/22/18.
//  Copyright © 2018 jawnyawn. All rights reserved.
//

import Foundation

class Player {

    var name: String = ""
    var streak: Int16 = 0
    var specials: Int16 = 0
    var wins: Int16 = 0
    var losses: Int16 = 0
    var ratioWL: Double = 0.00
    var kill: Int16 = 0
    var death: Int16 = 0
    var ratioKD: Double = 0.00
    var games: [Game]!

    class func parsePlayer(player: Player, playerDict: [String: Any]) -> Player {

        if let name = playerDict["name"] as? String {
            player.name = name
        }
        if let streak = playerDict["streak"] as? Int16 {
            player.streak = streak
        }
        if let specials = playerDict["specials"] as? Int16 {
            player.specials = specials
        }
        if let wins = playerDict["wins"] as? Int16, let losses = playerDict["losses"] as? Int16 {
            player.wins = wins
            player.losses = losses
        }
        if let kills = playerDict["kills"] as? Int16, let deaths = playerDict["deaths"] as? Int16 {
            player.kill = kills
            player.death = deaths
        }
        if let ratioWL = playerDict["ratioWL"] as? Double, let ratioKD = playerDict["ratioKD"] as? Double {
            player.ratioWL = ratioWL
            player.ratioKD = ratioKD
        }
        return player
    }
    
}
