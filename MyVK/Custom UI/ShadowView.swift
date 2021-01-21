//
//  ShadowV.swift
//  MyVK
//
//  Created by Валерий on 19.01.2021.
//

import UIKit

// Эффект тени, настраиваемый через interface builder
@IBDesignable class ShadowView: UIView {

    @IBInspectable var shadowColor: UIColor = .black {
        didSet{
            layer.shadowColor =  shadowColor.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity: Float  = 1.0 {
        didSet {
            layer.shadowOpacity = shadowOpacity/10
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = .zero {
        didSet {
            layer.shadowOffset = shadowOffset
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 12 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    
}

