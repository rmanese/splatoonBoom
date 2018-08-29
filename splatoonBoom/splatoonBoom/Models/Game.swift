//
//  Game.swift
//  splatoonBoom
//
//  Created by Roberto Manese III on 8/25/18.
//  Copyright © 2018 jawnyawn. All rights reserved.
//

import Foundation

enum MatchResult: String {
    case Win = "Victory"
    case Lose = "Defeat"
    case None
}

class Game {

    var gameID: String = ""
    var playerName: String = ""
    var playerKills: Int = 0
    var playerSpecials: Int = 0
    var gameResult: MatchResult = MatchResult.None

    class func parseGames(game: Game, data: [String: Any]) -> Game {
        if let gameResult = data["gameResults"] as? String {
            if gameResult == "Victory" {
                game.gameResult = MatchResult.Win
            } else if gameResult == "Defeat" {
                game.gameResult = MatchResult.Lose
            } else {
                game.gameResult = MatchResult.None
            }
        }
        if let playerName = data["playerName"] as? String {
            game.playerName = playerName
        }
        if let playerKills = data["playerKills"] as? Int {
            game.playerKills = playerKills
        }
        if let playerSpecials = data["playerSpecials"] as? Int {
            game.playerSpecials = playerSpecials
        }
        return game
    }

    class func convertToDict(game: Game) -> [String: Any] {
        return [
            "gameResult": game.gameResult,
            "playerName": game.playerName,
            "playerKills": game.playerKills,
            "playerSpecials": game.playerSpecials
        ]
    }
}
