//
//  PlayerInteractor.swift
//  splatoonBoom
//
//  Created by Roberto Manese III on 8/25/18.
//  Copyright © 2018 jawnyawn. All rights reserved.
//

import Foundation
import Firebase

class PlayerInteractor {

    private let dbRef = Database.database().reference()

    func fetchPlayer(completionHandler: @escaping (
        Player, Error?) -> Void) {
        dbRef.child("player").observeSingleEvent(of: .value) { (snapshot) in
            if let playerObj = snapshot.value as? [String: Any] {
                var player = Player()
                player = Player.parsePlayer(player: player, playerDict: playerObj)
                completionHandler(player, nil)
            }
        }
    }

    func fetchGame(completionHandler: @escaping (([Game], Error?) -> Void)) {
        dbRef.child("games").observeSingleEvent(of: .value) { (snapshot) in
            if let gameObj = snapshot.value as? [String: Any] {
                var games: [Game] = []
                for (gameID, gameDict) in gameObj {
                    var game = Game()
                    game.gameID = gameID
                    guard let gameDict = gameDict as? [String: Any] else { continue }
                    game = Game.parseGames(game: game, data: gameDict)
                    games.append(game)
                }
                completionHandler(games, nil)
            }
        }
    }
}
