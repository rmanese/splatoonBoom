//
//  Player.swift
//  splatoonBoom
//
//  Created by Roberto Manese III on 8/22/18.
//  Copyright © 2018 jawnyawn. All rights reserved.
//

import Foundation
import CoreData

@objc(Player)
class Player: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var win: Int16
    @NSManaged var lose: Int16
    @NSManaged var ratioWL: Int16
    @NSManaged var kill: Int16
    @NSManaged var death: Int16
    @NSManaged var ratioKD: Int16

}
