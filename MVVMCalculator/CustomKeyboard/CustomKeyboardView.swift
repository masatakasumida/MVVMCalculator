//
//  CustomKeyboardView.swift
//  CustomKeyboardView
//
//  Created by 住田雅隆 on 2022/08/11.
//
import UIKit

protocol CustomKeyboardViewDelegate: AnyObject {
    func customKeyboardView(_ customKeyboardView: CustomKeyboardView, didSelectKey key: String)
}

final class CustomKeyboardView: UIView {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var diviteButton: UIButton!
    @IBOutlet weak var equalButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!

    weak var delegate: CustomKeyboardViewDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadNib()
    }

    private func loadNib() {
        let view = Bundle.main.loadNibNamed("CustomKeyboardView", owner: self, options: nil)?.first as! UIView
        view.frame = bounds

        view.translatesAutoresizingMaskIntoConstraints = true
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        button0.calculatorButtonSetting()
        button1.calculatorButtonSetting()
        button2.calculatorButtonSetting()
        button3.calculatorButtonSetting()
        button4.calculatorButtonSetting()
        button5.calculatorButtonSetting()
        button6.calculatorButtonSetting()
        button7.calculatorButtonSetting()
        button8.calculatorButtonSetting()
        button9.calculatorButtonSetting()
        plusButton.calculatorButtonSetting()
        minusButton.calculatorButtonSetting()
        multiplyButton.calculatorButtonSetting()
        diviteButton.calculatorButtonSetting()
        equalButton.calculatorButtonSetting()
        deleteButton.calculatorButtonSetting()
    }

    @IBAction private func selectKey(_ sender: UIButton) {
        delegate?.customKeyboardView(self, didSelectKey: sender.titleLabel!.text!)
    }
}
