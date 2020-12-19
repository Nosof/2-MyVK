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
    
    var fImage: UIImage? = nil
    var fName: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        friendImg.image = fImage
        friendName.text = fName
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
