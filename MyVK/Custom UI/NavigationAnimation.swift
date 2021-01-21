//
//  NavigationAnimation.swift
//  MyVK
//
//  Created by Валерий on 20.01.2021.
//

import UIKit

class NavigationAnimation: UINavigationController, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    
    let interactiveTransition = InteractiveTransition()

    func navigationController(_ navigationController: UINavigationController,
                              interactionControllerFor animationController: UIViewControllerAnimatedTransitioning)
                              -> UIViewControllerInteractiveTransitioning? {
        return interactiveTransition.hasStarted ? interactiveTransition : nil
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            self.interactiveTransition.viewController = toVC
            return PushAnimator()
        } else if operation == .pop {
            if navigationController.viewControllers.first != toVC {
                        self.interactiveTransition.viewController = toVC
                    }
            return PopAnimator()
        }
        return nil
    }

}

