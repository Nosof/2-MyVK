//
//  FriendsTVC.swift
//  MyVK
//
//  Created by Валерий on 15.12.2020.
//

import UIKit

class FriendsTVC: UITableViewController {
    
    var friends: [(String, UIImage)] = [("Кени", UIImage (named: "Kenny")!),
                                        ("Кайл", UIImage (named: "Kyle")!),
                                        ("Стэнли", UIImage (named: "Stanley")!),
                                        ("Эрик", UIImage (named: "Eric")!),
                                        ("Баттерс", UIImage (named: "Butters")!),
                                        ("Полотенчик", UIImage (named: "Towelie")!)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Получаем ячейку из пула
        let cell = tableView.dequeueReusableCell(withIdentifier: "Friends", for: indexPath) as! FriendsTVCell
        
        // Получаем имя и фото для конкретной строки
        let index = friends[indexPath.row]
        let friend = index.0
        let foto = index.1
        // Устанавливаем элементы ячейки
        cell.friendName.text = friend
        cell.friendImg.image = foto
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "FriendID") as! FriendVC
        let index = friends[indexPath.row]
        viewController.fName = index.0
        viewController.fImage = index.1
        show(viewController, sender: nil)
        
        
        
    }
}



