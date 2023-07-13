//
//  MyOrderdCell.swift
//  RAHAL
//
//  Created by ahmed nagi on 29/06/2023.
//

import UIKit

class MyOrderdCell: UITableViewCell {
    static let identifier = "MyOrderdCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        separatorInset = .init(top: 0, left: 20, bottom: 0, right: 20)
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
