//
//  StringExtension.swift
//  MVVMCalculator
//
//  Created by 住田雅隆 on 2022/09/03.
//

import Foundation

extension String {
    // 演算子を計算可能なものに置き換える
    var replacedWithCalculatableOperators: String {
        replacingOccurrences(of: "÷", with: "/")
            .replacingOccurrences(of: "×", with: "*")
    }

    var dropLastOperator: String {
        if hasSuffix("+") || hasSuffix("-") || hasSuffix("*") || hasSuffix("/") {
            return String(dropLast())
        } else {
            return self
        }
    }

    func removingDuplicateSymbols() -> String {
        let duplicateSymbol: CharacterSet = ["+", "-", "×", "÷"]
        return self.trimmingCharacters(in: duplicateSymbol)
    }
}
