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

    var name: String = "JAwn"
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

    class func parsePlayer(player: Player, playerDict: [String: Any]) -> Player {
        if let name = playerDict["name"] as? String {
            player.name = name
        }
        if let streak = playerDict["streak"] as? Int {
            player.streak = streak
        }
        if let specials = playerDict["specials"] as? Int,
           let mostSpecials = playerDict["mostSpecials"] as? Int {
            player.specials = specials
            player.mostSpecials = mostSpecials
        }
        if  let wins = playerDict["wins"] as? Int,
            let losses = playerDict["losses"] as? Int,
            let totalGames = playerDict["totalGames"] as? Int {
            player.wins = wins
            player.losses = losses
            player.totalGames = totalGames
        }
        if let kills = playerDict["kills"] as? Int,
           let mostKills = playerDict["mostKills"] as? Int {
            player.kills = kills
            player.mostKills = mostKills
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
            "totalGames": player.totalGames,
            "ratioWL": player.ratioWL,
            "kills": player.kills,
            "mostKills": player.mostKills,
            "specials": player.specials,
            "mostSpecials": player.mostSpecials
        ]
    }

    class func setWLRatio(player: Player) -> Double {
        return Double(player.wins) / Double(player.totalGames)
    }

    class func setMostKills(game: Game, player: Player) -> Int {
        return game.playerKills > player.mostKills ? game.playerKills : player.mostKills
    }

    class func setMostSpecials(game: Game, player: Player) -> Int {
        return game.playerSpecials > player.mostSpecials ? game.playerSpecials : player.mostSpecials
    }
}
