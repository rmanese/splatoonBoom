//
//  Player.swift
//  splatoonBoom
//
//  Created by Roberto Manese III on 8/22/18.
//  Copyright © 2018 jawnyawn. All rights reserved.
//

import Foundation

// FEATURE
// var death: Int = 0
// var ratioKD: Double = 0.00

class Player {

    var name: String = ""
    var streak: Int = 0
    var specials: Int = 0
    var wins: Int = 0
    var losses: Int = 0
    var ratioWL: Double = 0.00
    var kills: Int = 0
    var games: [Game] = []

    class func parsePlayer(player: Player, playerDict: [String: Any]) -> Player {
        if let name = playerDict["name"] as? String {
            player.name = name
        }
        if let streak = playerDict["streak"] as? Int {
            player.streak = streak
        }
        if let specials = playerDict["specials"] as? Int {
            player.specials = specials
        }
        if let wins = playerDict["wins"] as? Int, let losses = playerDict["losses"] as? Int {
            player.wins = wins
            player.losses = losses
        }
        if let kills = playerDict["kills"] as? Int {
            player.kills = kills
        }
        if let ratioWL = playerDict["ratioWL"] as? Double {
            player.ratioWL = ratioWL
        }
        return player
    }

    class func convertToDict(player: Player) -> [String: Any] {
        return [
            "name": player.name,
            "streak": player.streak,
            "wins": player.wins,
            "losses": player.losses,
            "ratioWL": player.ratioWL,
            "kills": player.kills,
            "specials": player.specials
        ]
    }
    
}
