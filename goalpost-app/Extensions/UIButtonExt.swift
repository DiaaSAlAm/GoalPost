//
//  UIButtonExt.swift
//  goalpost-app
//
//  Created by MacBook Pro on 12/20/18.
//  Copyright © 2018 Caleb Stultz. All rights reserved.
//

import UIKit

extension UIButton {
    
    func setSelectedColor() {
        self.backgroundColor = #colorLiteral(red: 0.3017679751, green: 0.746871829, blue: 0.3396928906, alpha: 1)
    }
    
    func setDeselectedColor() {
        self.backgroundColor = #colorLiteral(red: 0.4274509804, green: 0.737254902, blue: 0.3882352941, alpha: 0.7967679795)
    }
}
