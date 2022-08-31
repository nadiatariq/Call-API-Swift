//
//  BillAmountTextField.swift
//  calculator App
//
//  Created by Nadia Tariq on 26/01/2022.
//

import UIKit

class BillAmountTextField: UITextField {

        
        // MARK: - Properties
        
        var calculateButtonAction: (() -> Void)?
        
        // MARK: - View Lifecycle
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            
            let toolbar: UIToolbar = UIToolbar()
            
            let leadingFlex = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            let trailingFlex = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            let calculateButton = UIBarButtonItem(title: "Calculate Tip", style: .done, target: self, action: #selector(calculateButtonTapped(_:)))
            toolbar.items = [leadingFlex, calculateButton, trailingFlex]
            
            // resizes toolbar
            toolbar.sizeToFit()
            
            self.inputAccessoryView = toolbar
        }
        
        @objc private func calculateButtonTapped(_ sender: UIBarButtonItem) {
            calculateButtonAction?()
        }
    }

