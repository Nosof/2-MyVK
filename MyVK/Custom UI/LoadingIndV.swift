//
//  LoadingIndV.swift
//  MyVK
//
//  Created by Валерий on 20.01.2021.
//

import UIKit

class LoadingIndV: UIView {

    override func layoutSubviews() {
        super.layoutSubviews()
        self.frame.size.width = 30
        self.frame.size.height = 30
        
        self.layer.opacity = 0.2
        self.layer.backgroundColor = UIColor.blue.cgColor
        self.layer.cornerRadius = self.frame.size.height / 2
        self.contentMode = .scaleAspectFit
        self.clipsToBounds = true
    }
    

}
