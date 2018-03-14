//
//  Extensions.swift
//  CacttusEdu
//
//  Created by Gent Berani on 3/14/18.
//  Copyright © 2018 CacttusEdu. All rights reserved.
//

import UIKit

extension String{
    
    func isEmptyOrWhitespace() -> Bool {
        if self.isEmpty || self.trimmingCharacters(in: CharacterSet.whitespaces).isEmpty{
            return true
        }
        return false
    }
    
    func removingWhiteSpaces() -> String{
        return components(separatedBy: .whitespaces).joined()
    }
}

extension Double{
    
    func rounded(toPlaces places: Int) -> Double{
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

//MARK:- UINavigationController extensions
public extension UINavigationController {
    
    func popWithAnim(transitionType type: String = kCATransitionFade, duration: CFTimeInterval = 0.3) {
        self.addTransition(transitionType: type, duration: duration)
        self.popViewController(animated: false)
    }
    
    func pushWithAnim(viewController vc: UIViewController, transitionType type: String = kCATransitionFade, duration: CFTimeInterval = 0.3) {
        self.addTransition(transitionType: type, duration: duration)
        self.pushViewController(vc, animated: false)
    }
    
    private func addTransition(transitionType type: String = kCATransitionFade, duration: CFTimeInterval = 0.3) {
        let transition = CATransition()
        transition.duration = duration
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = type
        self.view.layer.add(transition, forKey: nil)
    }
}

