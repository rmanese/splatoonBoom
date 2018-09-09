//
//  GameCell.swift
//  splatoonBoom
//
//  Created by Roberto Manese III on 8/31/18.
//  Copyright © 2018 jawnyawn. All rights reserved.
//

import UIKit

class GameCell: UITableViewCell {

    @IBOutlet weak var gameResultLabel: UILabel!
    @IBOutlet weak var gameSplatsTotalLabel: UILabel!
    @IBOutlet weak var gameSpecialsTotalLabel: UILabel!
    @IBOutlet weak var splatsIcon: UIImageView!
    @IBOutlet weak var specialsIcon: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()

        self.configureLayout()
    }

    private func configureLayout() {
        self.splatsIcon.layer.cornerRadius = 20
        self.splatsIcon.layer.backgroundColor = UIColor.black.cgColor
        self.specialsIcon.layer.cornerRadius = 20
        self.specialsIcon.layer.backgroundColor = UIColor.black.cgColor
    }

    private func setBackgroundColor(game: Game) {
        switch game.gameResult {
        case .Win:
            self.gameResultLabel.text = game.gameResult.rawValue
            self.gameResultLabel.backgroundColor = UIColor(red:0.26, green:0.79, blue:0.34, alpha:1.0)
            self.backgroundColor = UIColor(red: 0.10, green: 0.48, blue: 0.14, alpha: 0.75)
        case .Lose:
            self.gameResultLabel.text = game.gameResult.rawValue
            self.gameResultLabel.backgroundColor = UIColor.red
            self.backgroundColor = UIColor(red: 0.88, green: 0.25, blue: 0.25, alpha: 0.75)
        default:
            break
        }
    }

    func configureCell(game: Game) {
        self.setBackgroundColor(game: game)
        self.gameSplatsTotalLabel.text = "\(game.playerKills)"
        self.gameSpecialsTotalLabel.text = "\(game.playerSpecials)"
    }


}
