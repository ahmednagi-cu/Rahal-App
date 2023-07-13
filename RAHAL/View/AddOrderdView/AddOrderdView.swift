//
//  AddOrderdView.swift
//  RAHAL
//
//  Created by ahmed nagi on 29/06/2023.
//

import UIKit

class AddOrderdView: UIView {
  // MARK: - Outlets
    private lazy var typeOfOrderdContainerView: UIView = {
        let view = UIView().inputContainerView(with: UIImage(named: "Group 6993")!, TF: typeOfORderdTF,placeholder: " نوع الطلب", color: .white, isSecureText: false,textcolor: .black,placeholdercolor: .darkGray,backcolor: .white)
       
        return view
    }()
    
    private let typeOfORderdTF = UITextField()
    
    private lazy var quntatiyContainerView: UIView = {
        let view = UIView().inputContainerView(with: UIImage(named: ""), TF: quntatiyTF,placeholder: "الكميه", color: .white, isSecureText: false,textcolor: .black,placeholdercolor: .darkGray,backcolor: .white)
        return view
    }()
    
    private let quntatiyTF = UITextField()
    
    private lazy var placeOfOrderdContainerView: UIView = {
        let view = UIView().inputContainerView(with: UIImage(named: "pin"), TF: placeOfOrderdTF,placeholder: "مكان الطلب", color: .white, isSecureText: false,textcolor: .black,placeholdercolor: .darkGray,backcolor: .white)
        return view
    }()
    
    private let  placeOfOrderdTF = UITextField()
    
    private lazy var placeOfarriveContainerView: UIView = {
        let view = UIView().inputContainerView(with: UIImage(named: "pin"), TF: placeOfarriveTF,placeholder: "مكان التوصيل", color: .white, isSecureText: false,textcolor: .black,placeholdercolor: .darkGray,backcolor: .white)
        return view
    }()
    
    private let placeOfarriveTF = UITextField()
    
    private lazy var stackview: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [typeOfOrderdContainerView,quntatiyContainerView,placeOfOrderdContainerView,placeOfarriveContainerView,textview])
        stackview.axis = .vertical
        stackview.distribution = .fill
        stackview.spacing = 20
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    private lazy var textview: UITextView = {
        let text = UITextView()
        text.layer.cornerRadius = 12
        text.textAlignment = .right
        text.translatesAutoresizingMaskIntoConstraints = false
        text.heightAnchor.constraint(equalToConstant: 200).isActive = true
        text.addSubview(textviewTf)
        textviewTf.topAnchor.constraint(equalTo: text.topAnchor,constant: 15).isActive = true
        textviewTf.leadingAnchor.constraint(equalTo: text.leadingAnchor).isActive = true
        textviewTf.trailingAnchor.constraint(equalTo: text.trailingAnchor).isActive = true
        textviewTf.widthAnchor.constraint(equalTo: text.widthAnchor).isActive = true
        return text
    }()
    private let textviewTf: UITextField = {
        let tf = UITextField()
        tf.placeholder = "تفاصيل الطلب"
        tf.textColor = .black
        tf.attributedPlaceholder = NSAttributedString(string: "تفاصيل الطلب" ,attributes: [
            NSAttributedString.Key.foregroundColor : UIColor.darkGray as UIColor, NSAttributedString.Key.font : UIFont(name: "Tajawal-Regular", size: 23) as Any])
        tf.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        tf.rightViewMode = .always
        tf.textAlignment = .right
        tf.layer.cornerRadius = 12
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
   
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
 // MARK: - Helper Funtions
    
    private func configUI(){
        addSubview(stackview)
        configConstraints()
    }
    
    private func configConstraints(){
      let stackviewContainerViewCons = [
        stackview.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 50),
        stackview.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 22),
        stackview.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -22),
      ]
        NSLayoutConstraint.activate(stackviewContainerViewCons)
    }
    

}
