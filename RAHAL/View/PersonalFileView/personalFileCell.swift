//
//  personalFileCell.swift
//  RAHAL
//
//  Created by ahmed nagi on 27/06/2023.
//

import UIKit

class personalFileCell: UITableViewCell {
      static let identifier = "personalFileCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        separatorInset = .init(top: 0, left: 40, bottom: 0, right: 70)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
