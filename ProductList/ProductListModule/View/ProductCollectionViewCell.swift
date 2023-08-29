//
//  ProductCollectionViewCell.swift
//  ProductList
//
//  Created by Анна Иванова on 29.08.2023.
//

import UIKit

final class ProductCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.backgroundColor = .red
    }
}
