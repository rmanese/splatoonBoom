//
//  NewGameVC.swift
//  splatoonBoom
//
//  Created by Roberto Manese III on 8/26/18.
//  Copyright © 2018 jawnyawn. All rights reserved.
//

import UIKit

class NewGameVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    private var numberOfSpecials: [Int] = Array(0...9)
    private var numberOfKills: [Int] = Array(0...40)
    var currPlayer: Player!
    var newGame = Game()
    var interactor = NewGameInteractor()

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var specialPickerView: UIPickerView!
    @IBOutlet weak var killPickerView: UIPickerView!
    @IBOutlet weak var victoryButton: UIButton!
    @IBOutlet weak var defeatButton: UIButton!

    init(player: Player) {
        self.currPlayer = player
        super.init(nibName: nil, bundle: nil)
        self.title = "New Game"
        self.newGame.playerName = player.name
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.configure()
        self.specialPickerView.dataSource = self
        self.specialPickerView.delegate = self
        self.killPickerView.dataSource = self
        self.killPickerView.delegate = self
    }

    private func configure() {
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(didTapSaveButton))
        self.navigationItem.rightBarButtonItem = rightBarButton
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "new")!)
        self.nameLabel.text = self.currPlayer.name
        self.configureButton(button: self.victoryButton)
        self.victoryButton.addTarget(self, action: #selector(didTapVictoryButton), for: .touchUpInside)
        self.configureButton(button: self.defeatButton)
        self.defeatButton.addTarget(self, action: #selector(didTapDefeatButton), for: .touchUpInside)
    }

    private func configureButton(button: UIButton) {
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 10
        button.layer.borderColor = UIColor.white.cgColor
    }

    @objc func didTapSaveButton() {
        self.interactor.createGame(game: self.newGame) { (error) in }
        self.interactor.updatePlayer(player: self.currPlayer) { (error) in }
        self.navigationController?.popViewController(animated: true)
    }

    @objc func didTapVictoryButton() {
        self.newGame.gameResult = MatchResult.Win
        self.toggleBorderColor(matchResult: self.newGame.gameResult)
    }

    @objc func didTapDefeatButton() {
        self.newGame.gameResult = MatchResult.Lose
        self.toggleBorderColor(matchResult: self.newGame.gameResult)
    }

    func toggleBorderColor(matchResult: MatchResult) {
        switch matchResult{
        case .Win:
            self.victoryButton.layer.borderColor = UIColor(red:0.00, green:0.56, blue:0.00, alpha:1.0).cgColor
            self.defeatButton.layer.borderColor = UIColor.white.cgColor
            self.currPlayer.wins += 1
            self.currPlayer.streak += 1
        case .Lose:
            self.defeatButton.layer.borderColor = UIColor(red:1.00, green:0.18, blue:0.57, alpha:1.0).cgColor
            self.victoryButton.layer.borderColor = UIColor.white.cgColor
            self.currPlayer.losses += 1
            self.currPlayer.streak = 0
        default:
            self.defeatButton.layer.borderColor = UIColor.white.cgColor
            self.victoryButton.layer.borderColor = UIColor.white.cgColor
        }
    }

    // MARK: UIPickerView DataSource/Delegate
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        switch pickerView {
        case self.specialPickerView:
            return 1
        case self.killPickerView:
            return 1
        default:
            return 0
        }
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case self.specialPickerView:
            return self.numberOfSpecials.count
        case self.killPickerView:
            return self.numberOfKills.count
        default:
            return 0
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case self.specialPickerView:
            return String(self.numberOfSpecials[row])
        case self.killPickerView:
            return String(self.numberOfKills[row])
        default:
            return "0"
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case self.specialPickerView:
            self.newGame.playerSpecials = self.numberOfSpecials[row]
            self.currPlayer.specials = self.numberOfSpecials[row]
        case self.killPickerView:
            self.newGame.playerKills = self.numberOfKills[row]
            self.currPlayer.kills += self.numberOfKills[row]
        default:
            break
        }
    }
}
