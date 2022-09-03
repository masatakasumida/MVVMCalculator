//
//  UIButtonExtension.swift
//  MVVMCalculator
//
//  Created by 住田雅隆 on 2022/09/03.
//

import UIKit

extension UIButton {
    func calculatorButtonSetting() {
        backgroundColor = .systemGray5
        layer.cornerRadius = 6
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 3
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 1.5, height: 1.5)
    }

    func settingAcButton() {
        frame = CGRect(x: UIScreen.main.bounds.size.width / 2 - 40, y: 5, width: 80, height: 35)
        backgroundColor = .systemGray5
        layer.cornerRadius = 8
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 3
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 1.5, height: 1.5)
        setTitle("AC", for: UIControl.State.normal)
        setTitleColor(UIColor.systemRed, for: UIControl.State.normal)
    }
}

