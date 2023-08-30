//
//  UILabel.swift
//  ProductList
//
//  Created by Анна Иванова on 30.08.2023.
//

import UIKit

extension UILabel {
    
    func setupWith(size: CGFloat, weight: UIFont.Weight, textColor: UIColor, textAlignment: NSTextAlignment) {
        self.font = .systemFont(ofSize: size, weight: weight)
        self.textColor = textColor
        self.textAlignment = textAlignment
    }
}
