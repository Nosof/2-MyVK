//
//  FriendVC.swift
//  MyVK
//
//  Created by Валерий on 18.12.2020.
//

import UIKit

class FriendVC: UIViewController {
    
    
    @IBOutlet weak var friendImg: UIImageView!
    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var likeControl: LikeControl!
    
    
    var fImage: UIImage? = nil
    var fName: String? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        friendImg.image = fImage
        friendName.text = fName
        likeControl.isLiked = false
    }
}



