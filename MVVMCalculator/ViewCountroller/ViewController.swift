//
//  ViewController.swift
//  MVVMCalculator
//
//  Created by 住田雅隆 on 2022/09/03.
//

import UIKit

class ViewController: UIViewController, CustomKeyboardViewDelegate {
    func customKeyboardView(_ customKeyboardView: CustomKeyboardView, didSelectKey number: String) {
        guard let formulaText = calculationTextField.text else { return }
        calculationTextField.text = viewModel.didTappedNumber(number: number, formulaText: formulaText)
    }

    @IBOutlet weak var calculationTextField: UITextField!

    var viewModel: ViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ViewModel()
        createKeyboardView()
    }

    func createKeyboardView() {
        let keyboard = CustomKeyboardView(frame: .init(origin: .zero, size: .init(width: UIScreen.main.bounds.width, height: 284)))
        keyboard.delegate = self
        calculationTextField.inputView = keyboard

        // toolbar
        let toolbar = UIToolbar()
        toolbar.calculatorToolbarSettings()
        let doneButton = UIBarButtonItem(title: "完了", style: .done, target: self, action: #selector(self.doneButton))
        let taxButton = UIBarButtonItem(title: "税込(10%)", style: .done, target: self, action: #selector(self.taxButton))
        let flexibleItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolbar.setItems([doneButton, flexibleItem, taxButton], animated: true)

        calculationTextField.inputAccessoryView = toolbar

        let acButton = UIButton()
        acButton.settingAcButton()
        acButton.addTarget(self, action: #selector(tapAcButton), for: UIControl.Event.touchUpInside)
        toolbar.addSubview(acButton)
    }

    @objc func tapAcButton(_ sender: UIButton) {
        calculationTextField.text = "0"
    }

    @objc func taxButton() {
        if calculationTextField.text == "" {
            calculationTextField.text = "0"
        }
        let answer = viewModel.formattedAnswer(calculationTextField.text ?? "0")
        let taxAnswer = viewModel.taxAnswer(answer)
        calculationTextField.text = taxAnswer
    }

    @objc func doneButton() {
        if calculationTextField.text == "" {
            calculationTextField.text = "0"
        }
        let answer = viewModel.formattedAnswer(calculationTextField.text ?? "0")
        calculationTextField.text = answer
        calculationTextField.endEditing(true)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        calculationTextField.endEditing(true)
    }

}
