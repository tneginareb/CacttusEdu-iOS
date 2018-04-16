//
//  QytetTableCell.swift
//  CacttusEdu
//
//  Created by Gent Berani on 4/16/18.
//  Copyright © 2018 CacttusEdu. All rights reserved.
//

import UIKit

class QytetTableCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateViews(with qyteti: Qytet) {
        nameLabel.text = qyteti.name
    }
}
