//
//  PlayerVC.swift
//  splatoonBoom
//
//  Created by Roberto Manese III on 8/22/18.
//  Copyright © 2018 jawnyawn. All rights reserved.
//

import UIKit

class PlayerVC: UIViewController {

    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var playerStackView: UIStackView!

    var headerStackView = UIStackView()
    var dataStackView = UIStackView()
    var player = Player()
    var interactor = PlayerInteractor()

    override func viewDidLoad() {
        super.viewDidLoad()

        let rightBarButton = UIBarButtonItem(title: "New Match", style: .plain, target: self, action: #selector(newMatchTapped))
        self.navigationItem.rightBarButtonItem = rightBarButton
        self.fetchPlayer()
        self.configurePlayerStackView()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        self.fetchPlayer()
    }

    func prepareForReuse() {
        while !self.dataStackView.arrangedSubviews.isEmpty {
            self.dataStackView.arrangedSubviews[0].removeFromSuperview()
        }
    }

    func fetchPlayer() {
        interactor.fetchPlayer { (player, error) in
            self.player = player
            self.fetchGames()
            DispatchQueue.main.async {
                self.configureDataStackView()
                self.playerNameLabel.text = self.player.name
            }
        }
    }

    func fetchGames() {
        interactor.fetchGame { (games, error) in
            self.player.games = games
        }
    }

    func configurePlayerStackView() {
        self.playerStackView.addArrangedSubview(headerStackView)
        self.configureHeaderStackViews()
        self.playerStackView.addArrangedSubview(dataStackView)
        self.playerStackView.axis = .vertical
        self.playerStackView.distribution = .fillEqually
        self.playerStackView.spacing = 10
    }

    func configureHeaderStackViews() {
        let headers = ["win", "lose", "WL%", "kills", "specials"]
        for header in headers {
            let headerLabel = UILabel()
            headerLabel.text = header
            headerLabel.textAlignment = .center
            self.headerStackView.addArrangedSubview(headerLabel)
            headerLabel.sizeToFit()
        }
        self.headerStackView.distribution = .fillEqually
        self.headerStackView.spacing = 10
    }

    func configureDataStackView() {
        let playerData: [Any] = [self.player.wins, self.player.losses, self.player.ratioWL, self.player.kills, self.player.specials]
        self.prepareForReuse()
        for stat in playerData {
            let dataLabel = UILabel()
            dataLabel.text = "\(stat)"
            dataLabel.textAlignment = .center
            self.dataStackView.addArrangedSubview(dataLabel)
        }
        self.dataStackView.distribution = .fillEqually
        self.dataStackView.spacing = 10
        self.dataStackView.alignment = .center
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
        return UITableViewCell()
    }

}
