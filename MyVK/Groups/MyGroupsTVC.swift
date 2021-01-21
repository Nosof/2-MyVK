//
//  MyGroupsTVC.swift
//  MyVK
//
//  Created by Валерий on 15.12.2020.
//

import UIKit

class MyGroupsTVC: UITableViewController {
    
    var myGroups = [ Groups(name: "Готы", image: UIImage (named: "Goths")!)
]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addGroup (segue: UIStoryboardSegue) {
        
        // Проверяем идентификатор перехода, чтобы убедиться, что это нужный
        if segue.identifier == "addGroup" {
            // Получаем ссылку на контроллер, с которого осуществлен переход
            guard let groupsTVC = segue.source as? GroupsTVC else { return }
            // Получаем индекс выделенной ячейки
            if let indexPath = groupsTVC.tableView.indexPathForSelectedRow {
                // Получаем группу по индексу
                let group = groupsTVC.groups [indexPath.row]
                // Проверяем, что такой группы нет в списке
                if !myGroups.contains (group) {
                // Добавляем группу в список выбранных
                myGroups.append(group)
                // Обновляем таблицу
                tableView.reloadData ()
                }
            }
        }
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGroups.count
    }
    
    // высота ячейки
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Получаем ячейку из пула
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyGroups", for: indexPath) as! MyGroupsTVCell
        // Получаем группу для конкретной строки
        let index = myGroups[indexPath.row]
        let group = index.name
        let foto = index.image
        
        // Устанавливаем группу в надпись ячейки
        cell.myGroupName.text = group
        cell.myGroupImg.image = foto
        
        return cell
    }
    
    // функция удаления группы
    override func tableView (_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // Если была нажата кнопка «Удалить»
        if editingStyle == .delete {
            // Удаляем группу из массива
            myGroups.remove (at: indexPath.row)
            // И удаляем строку из таблицы
            tableView.deleteRows (at: [indexPath], with : .fade)
        }
    }
}
