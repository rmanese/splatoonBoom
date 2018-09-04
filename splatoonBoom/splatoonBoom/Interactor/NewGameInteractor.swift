//
//  NewGameInteractor.swift
//  splatoonBoom
//
//  Created by Roberto Manese III on 8/28/18.
//  Copyright © 2018 jawnyawn. All rights reserved.
//

import Foundation
import Firebase

class NewGameInteractor {

    private let dbRef = Database.database().reference()

    func createGame(game: Game, completionHandler: @escaping ((Error?) -> Void)) {
        let gameRef = dbRef.child("games").childByAutoId()
        gameRef.setValue(Game.convertToDict(game: game))
        completionHandler(nil)
    }

    func updatePlayer(player: Player, completionHandler: @escaping ((Error?) -> Void)) {
        let playerRef = dbRef.child("player")
        playerRef.setValue(Player.convertToDict(player: player))
        completionHandler(nil)
    }
}
