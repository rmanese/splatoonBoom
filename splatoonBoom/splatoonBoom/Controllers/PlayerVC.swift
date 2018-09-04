//
//  PlayerVC.swift
//  splatoonBoom
//
//  Created by Roberto Manese III on 8/22/18.
//  Copyright © 2018 jawnyawn. All rights reserved.
//

import UIKit

class PlayerVC: UIViewController {

    @IBOutlet private weak var playerNameLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var playerStackView: UIStackView!

    private var interactor = PlayerInteractor()

    var headerStackView = UIStackView()
    var dataStackView = UIStackView()
    var player = Player()

    override func viewDidLoad() {
        super.viewDidLoad()

        let rightBarButton = UIBarButtonItem(title: "New Match", style: .plain, target: self, action: #selector(newMatchTapped))
        self.navigationItem.rightBarButtonItem = rightBarButton
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
            }
        }
    }

    func fetchGames() {
        interactor.fetchGame { (games, error) in
            self.player.games = games
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
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
        let headers = ["Wins", "Losses", "WL%", "Splats", "Specials"]
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
            if stat as! Double == playerData[2] as! Double {
                dataLabel.text = String(format: "%.2f", self.player.ratioWL)
            } else {
                dataLabel.text = "\(stat)"
            }
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
        let cell = UITableViewCell()
        cell.textLabel?.text = self.player.games[indexPath.row].gameResult.rawValue
        return cell
    }

}
