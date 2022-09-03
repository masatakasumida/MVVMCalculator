//
//  UIToolBarExtension.swift
//  MVVMCalculator
//
//  Created by 住田雅隆 on 2022/09/03.
//

import UIKit

extension UIToolbar {
    func calculatorToolbarSettings() {
        frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 44)
        tintColor = .black
    }
}
