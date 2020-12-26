//
//  MyAvatarVC.swift
//  MyVK
//
//  Created by Валерий on 21.12.2020.
//

import UIKit

class MyAvatarVC: UIViewController {

    @IBOutlet weak var avatar: MyAvatarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        avatar.setImage(UIImage(named: "Homer")!)
    }
}
