//
//  PlayerVC.swift
//  splatoonBoom
//
//  Created by Roberto Manese III on 8/22/18.
//  Copyright © 2018 jawnyawn. All rights reserved.
//

import UIKit

class PlayerVC: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet weak var playerCard: PlayerCardView!
    private var interactor = PlayerInteractor()
    var player = Player()
    private let gameCellID = "GameCellID"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        self.title = "splatoonBoom"

        let rightBarButton = UIBarButtonItem(title: "New Match", style: .plain, target: self, action: #selector(newMatchTapped))
        self.navigationItem.rightBarButtonItem = rightBarButton

        self.tableView.register(UINib(nibName: String(describing: GameCell.self), bundle: nil), forCellReuseIdentifier: self.gameCellID)
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        self.fetchPlayer()
    }

    func fetchPlayer() {
        interactor.fetchPlayer { (player, error) in
            self.player = player
            self.fetchGames()
            DispatchQueue.main.async {
                self.playerCard.configure(player: player)
            }
        }
    }

    func fetchGames() {
        interactor.fetchGame { (games, error) in
            self.player.games = games.reversed()
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    @objc func newMatchTapped() {
        let vc = NewGameVC(player: self.player)
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

extension PlayerVC: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.player.games.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let gameCell = self.tableView.dequeueReusableCell(withIdentifier: self.gameCellID) as! GameCell
        gameCell.configureCell(game: player.games[indexPath.row])
        return gameCell
    }

}
