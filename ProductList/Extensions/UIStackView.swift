//
//  UIStackView.swift
//  ProductList
//
//  Created by Анна Иванова on 30.08.2023.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach(addArrangedSubview(_:))
    }
}
