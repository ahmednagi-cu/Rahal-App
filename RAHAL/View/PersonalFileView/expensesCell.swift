//
//  expensesCell.swift
//  RAHAL
//
//  Created by ahmed nagi on 27/06/2023.
//

import UIKit

class expensesCell: UITableViewCell {
    static let identifier = "expensesCell"
    
    @IBOutlet weak var containtview: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius = 12
        selectionStyle = .none
        containtview.layer.cornerRadius = 12
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
