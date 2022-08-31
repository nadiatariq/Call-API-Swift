//
//  ViewController.swift
//  calculator App
//
//  Created by Nadia Tariq on 24/01/2022.
//

import UIKit.UIColor

class ViewController: UIViewController {
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var themeSwitch: UISwitch!

    
    @IBOutlet weak var inputCardView: UIView!
    
  
    @IBOutlet weak var billAmountTextField: BillAmountTextField!
    
    @IBOutlet weak var tipPercentSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var outputCardView: UIView!
    
    @IBOutlet weak var tipAmountTitleLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    
    @IBOutlet weak var totalAmountTitleLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    
    @IBOutlet weak var resetButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tipPercentSegmentedControl.layer.borderColor = UIColor.tcHotPink.cgColor
        self.tipPercentSegmentedControl.layer.borderWidth = 1
          // function call
        setupViewsInput()
        setupViewsOutput()
        resetButtonCorner()
        billAmountTextField.calculateButtonAction = {
               self.calculate()
           }
       
    }
    @IBAction func themeToggled(_ sender: UISwitch) {
        if sender.isOn{
            print("switch toggled on")
        
        }else{
            print("switch toggled off")
        }
    }
    
    @IBAction func tipPercentChanged(_ sender: Any) {
        print("percentage choose")
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        clear()
    }
    
    
    func clear() {
        billAmountTextField.text = nil
        tipPercentSegmentedControl.selectedSegmentIndex = 0
        tipAmountLabel.text = "$0.00"
        totalAmountLabel.text = "$0.00"
    }
    
    func calculate() {
        // dismiss keyboard
        if self.billAmountTextField.isFirstResponder {
            self.billAmountTextField.resignFirstResponder()
        }

        guard let billAmountText = self.billAmountTextField.text,
            let billAmount = Double(billAmountText) else {
                return
        }

        let roundedBillAmount = (100 * billAmount).rounded() / 100

        let tipPercent: Double
        switch tipPercentSegmentedControl.selectedSegmentIndex {
        case 0:
            tipPercent = 0.15
        case 1:
            tipPercent = 0.18
        case 2:
            tipPercent = 0.20
        default:
            preconditionFailure("Unexpected index.")
        }

        let tipAmount = roundedBillAmount * tipPercent
        let roundedTipAmount = (100 * tipAmount).rounded() / 100

        let totalAmount = roundedBillAmount + roundedTipAmount

        // Update UI
        self.billAmountTextField.text = "\(roundedBillAmount)"
        self.tipAmountLabel.text = "\(roundedTipAmount)"
        self.totalAmountLabel.text = String(format: "%.2f", totalAmount)
    
}
    func setupViewsInput() {
        headerView.layer.shadowOffset = CGSize(width: 0, height: 1)
        headerView.layer.shadowOpacity = 2
        headerView.layer.shadowColor = UIColor.black.cgColor
        headerView.layer.shadowRadius = 35
        inputCardView.layer.cornerRadius = 8
        inputCardView.layer.masksToBounds = true
    }
    func setupViewsOutput() {
        headerView.layer.shadowOffset = CGSize(width: 0, height: 1)
        headerView.layer.shadowOpacity = 0.05
        headerView.layer.shadowColor = UIColor.black.cgColor
        headerView.layer.shadowRadius = 35
        outputCardView.layer.cornerRadius = 8
        outputCardView.layer.masksToBounds = true
        outputCardView.layer.borderWidth = 1
        outputCardView.layer.borderColor = UIColor.tcHotPink.cgColor
    }
    func resetButtonCorner(){
        resetButton.layer.cornerRadius = 8
        resetButton.layer.masksToBounds = true
    }
    
}

