//
//  Calculator.swift
//  MVVMCalculator
//
//  Created by 住田雅隆 on 2022/09/03.
//

import Foundation

struct Calculator {

    func formattedAnswer(_ formula: String) -> String {
        String(
            Int(
                NSExpression(
                    format: formula.replacedWithCalculatableOperators.dropLastOperator
                )
                .expressionValue(with: nil, context: nil) as! Double
            )
        )
    }

    func taxAnswer(_ amount: String) -> String {
        let taxAnswer = (Double(amount) ?? 0) * 1.1
        return String(Int(floor(taxAnswer)))
    }
}
