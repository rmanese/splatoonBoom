//
//  PlayerVC.swift
//  splatoonBoom
//
//  Created by Roberto Manese III on 8/22/18.
//  Copyright © 2018 jawnyawn. All rights reserved.
//

import UIKit

class PlayerVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let rightBarButton = UIBarButtonItem(title: "New Match", style: .plain, target: self, action: #selector(newMatchTapped))
        self.navigationItem.rightBarButtonItem = rightBarButton
    }

    @objc func newMatchTapped() {
        return 
    }

}
