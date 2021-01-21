//
//  PushAnimator.swift
//  MyVK
//
//  Created by Валерий on 20.01.2021.
//

import UIKit

final class PushAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from),
              let destination = transitionContext.viewController(forKey: .to) else { return}
        
        transitionContext.containerView.addSubview(destination.view)
        
        let containerViewFrame = transitionContext.containerView.frame
        destination.view.frame = source.view.frame
        destination.view.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        destination.view.transform = CGAffineTransform(translationX: containerViewFrame.width, y: -containerViewFrame.height*2.5)
        
        
        
        UIView.animateKeyframes(withDuration: self.transitionDuration(using: transitionContext),
                                delay: 0,
                                options: .calculationModePaced,
                                animations: {
                                    UIView.addKeyframe(withRelativeStartTime: 0,
                                                       relativeDuration: 0.75,
                                                       animations: {
                                                        let rot = CGAffineTransform(rotationAngle: CGFloat.pi/2)
                                                        let translationX = CGAffineTransform(translationX: -source.view.frame.height, y: source.view.frame.height)
                                                       
                                                        // let scale = CGAffineTransform(scaleX: 0.8, y: 0.8)
                                                        source.view.transform = translationX.concatenating(rot)
                                    })
                                    UIView.addKeyframe(withRelativeStartTime: 0.6,
                                                       relativeDuration: 0.4,
                                                       animations: {
                                                           let rot2 = CGAffineTransform(rotationAngle: -CGFloat.pi/2)
                                                           let translation = CGAffineTransform(translationX: containerViewFrame.width, y: containerViewFrame.height)
                                                           //let scale = CGAffineTransform(scaleX: 1.2, y: 1.2)
                                                        destination.view.transform = translation.concatenating(rot2)
                                                        
                                    })
                                    UIView.addKeyframe(withRelativeStartTime: 0.9,
                                                       relativeDuration: 0.4,
                                                       animations: {
                                                           destination.view.transform = .identity
                                    })
        }) { finished in
            if finished && !transitionContext.transitionWasCancelled {
                source.view.transform = .identity
            }
            transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
        }
    }
    
}
