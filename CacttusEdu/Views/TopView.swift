//
//  TopView.swift
//  CacttusEdu
//
//  Created by Gent Berani on 3/12/18.
//  Copyright © 2018 CacttusEdu. All rights reserved.
//

import UIKit

@IBDesignable
class TopView: UIView {
    
    var contentView: UIView?
    @IBInspectable var nibName: String = "TopView"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        xibSetup()
    }
    
    private func xibSetup(){
        guard let view = loadViewFromNib() else {return}
        
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        addSubview(view)
        contentView = view
    }
    
    private func loadViewFromNib() -> UIView?{
        let bundle = Bundle(for: type(of: self))
        let nib = UINib.init(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        xibSetup()
        contentView?.prepareForInterfaceBuilder()
    }
    
    
}
