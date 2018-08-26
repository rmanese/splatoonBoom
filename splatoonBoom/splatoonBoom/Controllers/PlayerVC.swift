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
    
    var player = Player()
    var interactor = PlayerInteractor()

    override func viewDidLoad() {
        super.viewDidLoad()

        let rightBarButton = UIBarButtonItem(title: "New Match", style: .plain, target: self, action: #selector(newMatchTapped))
        self.navigationItem.rightBarButtonItem = rightBarButton
        interactor.fetchPlayer { (player, error) in
            self.player = player
            DispatchQueue.main.async {
                self.playerNameLabel.text = self.player.name
            }
        }

        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    @objc func newMatchTapped() {
        let vc = NewGameVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

extension PlayerVC: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

}
