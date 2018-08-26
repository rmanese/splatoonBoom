//
//  playerInteractor.swift
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

}
