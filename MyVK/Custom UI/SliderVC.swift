//
//  SliderVC.swift
//  MyVK
//
//  Created by Валерий on 21.01.2021.
//

import UIKit

class SliderVC: UIViewController {
    
    
    var photoLibrary = [UIImage?]()
    
    var currentImage = 0
    
    @IBOutlet weak var displayedImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayedImage.image = photoLibrary[currentImage]
        
        displayedImage.isUserInteractionEnabled = true
        displayedImage.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(respondToPanGesture)))
    
    }
    
    //MARK: - Swipe and Pan Recognizer Logic
    
    @objc func respondToPanGesture(gesture: UIPanGestureRecognizer) {

        if gesture.state == .changed {
            
            let translation = gesture.translation(in: view)
            displayedImage.transform = CGAffineTransform(translationX: translation.x, y: 0)
            
        } else if gesture.state == .ended {
            
            if displayedImage.frame.maxX <= view.frame.maxX * 0.65 {
                currentImage == photoLibrary.count - 1 ? currentImage = 0 : (currentImage += 1)
                leftSwipeAnimation()
                
            } else if displayedImage.frame.minX >= view.frame.maxX * 0.35 {
                currentImage == 0 ? (currentImage = photoLibrary.count - 1) : (currentImage -= 1)
                rightSwipeAnimation()
                
            } else {
                UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1.0, options: .curveEaseIn, animations: {
                    self.displayedImage.transform = .identity
                }, completion: nil)
            }
        }
    }
    

    //MARK: - Swipe Animation Functions
    
    func leftSwipeAnimation() {
        UIView.animate(withDuration: 0.3) {
            self.displayedImage.frame = self.displayedImage.frame.offsetBy(dx: -self.view.frame.maxX, dy: 0)
            self.displayedImage.layer.opacity = 0.0
            self.displayedImage.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        } completion: { _ in
            UIView.animate(withDuration: 0.01) {
                self.displayedImage.frame = self.displayedImage.frame.offsetBy(dx: +self.view.frame.maxX, dy: 0)
            } completion: { _ in
                UIView.animate(withDuration: 0.3) {
                    self.displayedImage.image = self.photoLibrary[self.currentImage]
                    self.displayedImage.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                    
                    self.displayedImage.layer.opacity = 1.0
                }
            }
        }
    }
    
    func rightSwipeAnimation() {
        UIView.animate(withDuration: 0.3) {
            self.displayedImage.frame = self.displayedImage.frame.offsetBy(dx: +self.view.frame.maxX, dy: 0)
            self.displayedImage.layer.opacity = 0.0
            self.displayedImage.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        } completion: { _ in
            UIView.animate(withDuration: 0.01) {
                self.displayedImage.frame = self.displayedImage.frame.offsetBy(dx: -self.view.frame.maxX, dy: 0)
            } completion: { _ in
                UIView.animate(withDuration: 0.3) {
                    self.displayedImage.image = self.photoLibrary[self.currentImage]
                    self.displayedImage.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                    
                    self.displayedImage.layer.opacity = 1.0
                }
            }
        }
    }
    
    
}

