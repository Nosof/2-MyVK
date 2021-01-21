//
//  FriendsTVC.swift
//  MyVK
//
//  Created by Валерий on 15.12.2020.
//

import UIKit

class FriendsTVC: UITableViewController {
    
    private var friends = [
        Friends(name: "Кени", image: UIImage (named: "Kenny")!),
        Friends(name: "Кайл", image: UIImage (named: "Kyle")!),
        Friends(name: "Стэнли", image: UIImage (named: "Stanley")!),
        Friends(name: "Эрик", image: UIImage (named: "Eric")!),
        Friends(name: "Баттерс", image: UIImage (named: "Butters")!),
        Friends(name: "Полотенчик", image: UIImage (named: "Towelie")!)
    ]
    
    var sections: [String: [Friends]] = [:]
    var keys: [String] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        friends.forEach { friend in
            let firstLetter = String(friend.name.first!)
            if sections[firstLetter] != nil {
                sections[firstLetter]!.append(friend)
            } else {
                sections[firstLetter] = [friend]
            }
        }
        keys = Array(sections.keys).sorted(by: <)
    }
    // MARK: - Table view data source
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return keys
    }
    override func tableView(_ tableview: UITableView, titleForHeaderInSection section: Int) -> String? {
        return keys[section]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = keys[section]
        let count = sections[key]!.count
        return count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Получаем ячейку из пула
        let cell = tableView.dequeueReusableCell(withIdentifier: "Friends", for: indexPath) as! FriendsTVCell
        
        // Получаем имя и фото для конкретной строки
        let key = keys[indexPath.section]
        let friend = sections[key]![indexPath.row]
        
        // Устанавливаем элементы ячейки
        cell.friendName.text = friend.name
        cell.friendImg.image = friend.image
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "FriendID") as! FriendVC

        let key = keys[indexPath.section]
        let friend = sections[key]![indexPath.row]
        viewController.fName = friend.name
        viewController.fImage = friend.image
        show(viewController, sender: nil)
    }
    
    

    
}


