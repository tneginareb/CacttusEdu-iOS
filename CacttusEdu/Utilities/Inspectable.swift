
//
//  Inspectable.swift
//  CacttusEdu
//
//  Created by Gent Berani on 3/14/18.
//  Copyright © 2018 CacttusEdu. All rights reserved.
//

import UIKit

@IBDesignable extension UIView{
    //Border Color
    //Border Width
    //Corner Radius
    
    @IBInspectable var borderColor: UIColor?{
        set{
            layer.borderColor = newValue?.cgColor
        }
        
        get{
            if let color = layer.borderColor{
                return UIColor(cgColor:color)
            }else{
                return nil
            }
        }
    }
    
    @IBInspectable var borderWidth: CGFloat{
        set{
            layer.borderWidth = newValue
        }
        
        get{
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat{
        set{
            layer.cornerRadius = newValue
            clipsToBounds = newValue > 0
        }
        get{
            return layer.cornerRadius
        }
    }
}

@IBDesignable extension UITextField{
    
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedStringKey.foregroundColor: newValue!])
        }
    }
}
