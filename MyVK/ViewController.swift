//
//  ViewController.swift
//  MyVK
//
//  Created by Валерий on 03.12.2020.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    
    // -- отключил пока редактирую

//    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
//        // Проверяем данные
//        let checkResult = checkUserData()
//        // Если данные не верны, покажем ошибку
//        if !checkResult {
//            showLoginError()
//        }
//        // Вернем результат
//        return checkResult
//    }
//
//    func checkUserData() -> Bool {
//        guard let login =  loginInput.text, let password = passwordInput.text else { return false }
//
//        if login == "admin" && password == "111" {
//            return true
//        } else {
//            return false
//        }
//    }
//    func showLoginError() {
//        // Создаем контроллер
//        let alert = UIAlertController (title: "Ошибка", message: "Введены не верные данные пользователя (admin / 111)", preferredStyle: .alert)
//        // Создаем кнопку для UIAlertController
//        let action = UIAlertAction (title: "Ok", style: .cancel, handler: nil)
//        // Добавляем кнопку на UIAlertController
//        alert.addAction(action)
//        // Показываем UIAlertController
//        present (alert, animated: true, completion: nil)
//
//    }
}


