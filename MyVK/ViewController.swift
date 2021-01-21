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
    
    @IBOutlet weak var ind_01: LoadingIndV!
    @IBOutlet weak var ind_02: LoadingIndV!
    @IBOutlet weak var ind_03: LoadingIndV!
    
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
    
    override func viewDidAppear(_ animated: Bool) {
        
        let indArray = [ind_01, ind_02, ind_03]
        var delay: TimeInterval = 0
        
        for loadInd in indArray {
            if let ind = loadInd {
                UIView.animate(withDuration: 0.3,
                               delay: 0,
                               options: [.repeat, .autoreverse],
                               animations: {
                                self.opacityLoadIndicator(ind, delay: delay)
                })
            }
            delay += 0.1
        }
        delay = 0
    }
    
    private func opacityLoadIndicator(_ sender: UIView, delay: TimeInterval){
        let animation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        animation.beginTime = CACurrentMediaTime() + delay
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = 0.5
        animation.autoreverses = true
        animation.repeatCount = .infinity
        sender.layer.add(animation, forKey: nil)
        

    }
}


