//
//  NewsTVCell.swift
//  MyVK
//
//  Created by Валерий on 19.01.2021.
//

import UIKit

class NewsTVCell: UITableViewCell {
   
    @IBOutlet weak var newsLabel: UILabel!
    @IBOutlet weak var newsImg: UIImageView!
    
    @IBOutlet weak var like: UIButton!
    @IBOutlet weak var comment: UIButton!
    @IBOutlet weak var forward: UIButton!
    @IBOutlet weak var looks: UIButton!

    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
