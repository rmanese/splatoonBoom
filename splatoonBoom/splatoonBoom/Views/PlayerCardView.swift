//
//  PlayerCardView.swift
//  splatoonBoom
//
//  Created by Roberto Manese III on 9/1/18.
//  Copyright © 2018 jawnyawn. All rights reserved.
//

import UIKit

class PlayerCardView: UIView {

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

    }

}
