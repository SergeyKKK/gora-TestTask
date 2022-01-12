//
//  UIView.swift
//  goraTestTask
//
//  Created by Serega Kushnarev on 12.01.2022.
//

import UIKit

extension UIView {
    
    func dropShadow() {
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 5
    }
    
    func border() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
    }
}
