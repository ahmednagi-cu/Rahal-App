//
//  Extension.swift
//  RAHAL
//
//  Created by ahmed nagi on 26/06/2023.
//

import UIKit

extension UIView {
    
    func inputContainerView(with image: UIImage?, TF: UITextField,placeholder: String, color: UIColor?,isSecureText: Bool,textcolor: UIColor?,placeholdercolor: UIColor?,backcolor: UIColor?) -> UIView{
        /// container view
        let numView = UIView()
         numView.backgroundColor = color
         numView.heightAnchor.constraint(equalToConstant: 44).isActive = true
         numView.translatesAutoresizingMaskIntoConstraints = false
         numView.layer.cornerRadius = 20
        /// image icon
         let iconNumImg = UIImageView()
         iconNumImg.image = image
         iconNumImg.translatesAutoresizingMaskIntoConstraints = false
         iconNumImg.contentMode = .scaleAspectFill

        /// texfield
        let number = UITextField()
         number.placeholder = placeholder
         number.font = UIFont(name: "Tajawal-Regular", size: 23)
         number.backgroundColor = backcolor
         number.attributedPlaceholder = NSAttributedString(string: placeholder,attributes: [
            NSAttributedString.Key.foregroundColor : (placeholdercolor ?? .white) as UIColor, NSAttributedString.Key.font : UIFont(name: "Tajawal-Regular", size: 23) as Any])
         number.textAlignment = .right
         number.textColor = textcolor
         number.keyboardType = .numberPad
         number.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
         number.rightViewMode = .always
         number.layer.cornerRadius = 20
        number.isSecureTextEntry = isSecureText
         number.translatesAutoresizingMaskIntoConstraints = false
         numView.addSubview(number)
         numView.addSubview(iconNumImg)
        
         number.topAnchor.constraint(equalTo: numView.topAnchor).isActive = true
         number.trailingAnchor.constraint(equalTo: numView.trailingAnchor).isActive = true
         number.bottomAnchor.constraint(equalTo: numView.bottomAnchor).isActive = true
         number.leadingAnchor.constraint(equalTo: iconNumImg.trailingAnchor,constant: 3).isActive = true
        
         iconNumImg.centerYAnchor.constraint(equalTo: numView.centerYAnchor).isActive = true
         iconNumImg.leadingAnchor.constraint(equalTo: numView.leadingAnchor,constant: 15).isActive = true
         iconNumImg.widthAnchor.constraint(equalToConstant: 14).isActive = true
         iconNumImg.heightAnchor.constraint(equalToConstant: 12).isActive = true
        return numView
    }
}

extension UIButton {
    func infoBtn(with image: UIImage) -> UIButton {
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
}


