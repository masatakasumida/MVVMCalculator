//
//  ViewModel.swift
//  MVVMCalculator
//
//  Created by 住田雅隆 on 2022/09/03.
//

import Foundation

class ViewModel  {
    func didTappedNumber(number: String, formulaText: String) -> String {

        var outputText = ""

        switch number {
        case "0"..."9":
            if formulaText == "0" {
                outputText = number
            } else {
                outputText = formulaText + number
            }
        case "+", "-", "×", "÷":
            outputText = formulaText.removingDuplicateSymbols() + number
        case "⌫":
            let deleteBackward = formulaText.dropLast()
            if formulaText.count == 1 {
                outputText = "0"
            } else {
                outputText = String(deleteBackward)
            }
        case "=":
            if formulaText == "" {
                outputText = "0"
            }
            let answer = formattedAnswer(formulaText)
            outputText = answer
        default:
            break
        }
        return outputText
    }

    func formattedAnswer(_ formula: String) -> String {
        Calculator().formattedAnswer(formula)
    }

    func taxAnswer(_ amount: String) -> String {
        Calculator().taxAnswer(amount)
    }
}
