//
//  MyGroupsTVCell.swift
//  MyVK
//
//  Created by Валерий on 15.12.2020.
//

import UIKit

class MyGroupsTVCell: UITableViewCell {

    @IBOutlet weak var myGroupName: UILabel!
    @IBOutlet weak var myGroupImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
