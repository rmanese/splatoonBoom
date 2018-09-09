//
//  PlayerCardView.swift
//  splatoonBoom
//
//  Created by Roberto Manese III on 9/1/18.
//  Copyright © 2018 jawnyawn. All rights reserved.
//

import UIKit

class PlayerCardView: UIView {

    @IBOutlet private weak var totalGames: UILabel!
    @IBOutlet private weak var totalWins: UILabel!
    @IBOutlet private weak var totalLosses: UILabel!
    @IBOutlet private weak var wlRatio: UILabel!
    @IBOutlet private weak var totalSplats: UILabel!
    @IBOutlet private weak var mostSplats: UILabel!
    @IBOutlet private weak var totalSpecials: UILabel!
    @IBOutlet private weak var mostSpecials: UILabel!

    @IBOutlet var statLabelArray: [UILabel]!
    @IBOutlet private var playerCardView: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }

    private func commonInit() {
        let nib = UINib(nibName: "PlayerCardView", bundle: nil)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        self.addSubview(view)
        view.frame = self.bounds

        //Custom logic
        self.playerCardView.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "new"))
        self.configureLabels()
    }

    func configure(player: Player) {
        self.totalGames.text = "Games: \(player.totalGames)"
        self.totalWins.text = "Wins: \(player.wins)"
        self.totalLosses.text = "Losses: \(player.losses)"
        self.wlRatio.text = "W/L%: " + String(format: "%.2f", player.ratioWL)
        self.totalSplats.text = "Splats: \(player.kills)"
        self.mostSplats.text = "Most Splats:"
        self.totalSpecials.text = "Specials: \(player.specials)"
        self.mostSpecials.text = "Most Specials: \(player.mostSpecials)"
        self.mostSplats.text = "Most Splats: \(player.mostKills)"
    }

    func configureLabels() {
        for label in self.statLabelArray {
            label.font = UIFont(name: "Noteworthy-Bold", size: 18)
            label.textColor = UIColor.white
            label.backgroundColor = UIColor(red: 0.07, green: 0.09, blue: 0.07, alpha: 0.80)
        }
    }

}
