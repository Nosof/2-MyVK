//
//  MyAvatarView.swift
//  MyVK
//
//  Created by Валерий on 21.12.2020.
//

import UIKit

class MyAvatarView: UIView {
    
    var myAvatar: UIImageView? = nil
    
    func setImage(_ image: UIImage) {
        myAvatar = UIImageView(frame: self.bounds)
        myAvatar?.image = image
        myAvatar?.layer.cornerRadius = self.frame.size.height / 2
        myAvatar?.layer.masksToBounds = true
        
        self.backgroundColor = .clear
        self.addSubview(myAvatar!)
    }
    
    override func draw(_ rect: CGRect) {
        layer.shadowColor = UIColor.blue.cgColor
        layer.shadowRadius = 20
        layer.shadowOpacity = 1.0
    }
    
}
