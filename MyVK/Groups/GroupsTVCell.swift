//
//  GroupsTVCell.swift
//  MyVK
//
//  Created by Валерий on 15.12.2020.
//

import UIKit

class GroupsTVCell: UITableViewCell {

    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var groupImg: UIImageView!
  
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
