//
//  GroupsTVC.swift
//  MyVK
//
//  Created by Валерий on 15.12.2020.
//

import UIKit

class GroupsTVC: UITableViewController {
    
    var groups = [ Groups(name: "Готы", image: UIImage (named: "Goths")!),
                   Groups(name: "Вампиры", image: UIImage (named: "Vampires")!)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Получаем ячейку из пула
        let cell = tableView.dequeueReusableCell(withIdentifier: "Groups", for: indexPath) as! GroupsTVCell
        // Получаем группу для конкретной строки
        let index = groups[indexPath.row]
        let group = index.name
        let foto = index.image
        
        // Устанавливаем группу в надпись ячейки
        cell.groupName.text = group
        cell.groupImg.image = foto
        
        return cell
    }
    
}
