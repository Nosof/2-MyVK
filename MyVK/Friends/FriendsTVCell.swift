//
//  FriendsTVCell.swift
//  MyVK
//
//  Created by Валерий on 15.12.2020.
//

import UIKit

class FriendsTVCell: UITableViewCell {
    
    @IBOutlet weak var friendName: UILabel!
    
    // к даннаому view подключен class ShadowView для настройки в interface builder
    @IBOutlet weak var shadowView: UIView! {
        didSet {
            self.shadowView.layer.cornerRadius = self.shadowView.frame.width / 2
        }
    }
 
    @IBOutlet weak var friendImg: UIImageView!
// скругление самой картинки бордюр и цвет
//    {
//        didSet {
//            self.friendImg.clipsToBounds = true
//            self.friendImg.layer.cornerRadius = self.friendImg.frame.size.width / 2
//            self.friendImg.layer.borderWidth = 1
//            self.friendImg.layer.borderColor = UIColor.systemBlue.cgColor
//        }
//    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupGestureRecognizer(friendImg)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupGestureRecognizer(_ localSender: UIImageView){
        let gestureTap = UITapGestureRecognizer(target: self, action: #selector(avatarTapped))
        localSender.isUserInteractionEnabled = true
        gestureTap.numberOfTapsRequired = 1
        localSender.addGestureRecognizer(gestureTap)
    }
    
    @objc func avatarTapped(_ sender: UIGestureRecognizer) {
        
        if let animatedView = sender.view {
            let animation = CASpringAnimation(keyPath: "transform.scale")
            animation.duration = 0.3
            animation.fromValue = 1.0
            animation.toValue = 0.8
            animation.damping = 0.1
            animation.stiffness = 200
            animation.mass = 0.5
            animatedView.layer.add(animation, forKey: nil)
        }
    }
    
}

