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
    
    //MARK:- IB Outlets
    var contentView:UIView?
    
    //MARK:- Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupThisView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupThisView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupThisView()
        contentView?.prepareForInterfaceBuilder()
    }
    
    //MARK:- Lifecycle methods
    private func setupThisView(){
        guard let view = loadViewFromNib() else { return }
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        contentView = view
    }
    
    func loadViewFromNib() -> UIView? {
        let nibName = String(describing: TopView.self)
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self,options: nil).first as? UIView
    }
}
