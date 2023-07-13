//
//  RegisterView.swift
//  RAHAL
//
//  Created by ahmed nagi on 26/06/2023.
//

import UIKit

class RegisterView: UIView {
    
    // MARK: - Layout
       private let containerImg: UIImageView = {
           let image = UIImageView()
           image.image = UIImage(named: "background")
           image.translatesAutoresizingMaskIntoConstraints = false
           image.contentMode = .scaleAspectFill
           image.alpha = 0.5
           return image
       }()
       private let logo: UIImageView = {
           let image = UIImageView()
           image.image = UIImage(named: "logo")
           image.translatesAutoresizingMaskIntoConstraints = false
           image.contentMode = .scaleAspectFill
           return image
       }()
       private let backImg: UIImageView = {
           let image = UIImageView()
           image.image = UIImage(named: "Path 8808")
           image.translatesAutoresizingMaskIntoConstraints = false
           image.contentMode = .scaleAspectFill
           return image
       }()
       private let registerLBL: UILabel = {
          let lable = UILabel()
           lable.text = "تسجيل جديد"
           lable.font = UIFont(name: "Tajawal-Regular", size: 35)
           lable.textColor = UIColor(white: 1, alpha: 1)
           lable.translatesAutoresizingMaskIntoConstraints = false
           return lable
       }()
    
    private lazy var nameContainerView: UIView = {
        let numView = UIView().inputContainerView(with: UIImage(named: "Group 92")!, TF: nameTF,placeholder: "الاسم الشخصي", color: .darkGray, isSecureText: false,textcolor: .white,placeholdercolor: .white,backcolor: .darkGray)
        return numView
    }()
    
    private let nameTF = UITextField()
    
       private lazy var numberContainerView: UIView = {
           let numView = UIView().inputContainerView(with: UIImage(named: "Group 125")!, TF: numberTF,placeholder: "رقم الجوال", color: .darkGray, isSecureText: false,textcolor: .white,placeholdercolor: .white,backcolor: .darkGray)
           return numView
       }()
       private let numberTF = UITextField()
       
       private lazy var passwordContainerView: UIView = {
           let numView = UIView().inputContainerView(with: UIImage(named: "Group 30")!, TF: passwordTF,placeholder: "كلمة المرور", color: .darkGray, isSecureText: true,textcolor: .white,placeholdercolor: .white,backcolor: .darkGray)
           return numView
       }()
       private let passwordTF = UITextField()
    
    private lazy var confirmPassContainerView: UIView = {
        let numView = UIView().inputContainerView(with: UIImage(named: "Group 30")!, TF: confirmpasswordTF,placeholder: "تاكيد كلمة المرور", color: .darkGray, isSecureText: true,textcolor: .white,placeholdercolor: .white,backcolor: .darkGray)
        return numView
    }()
    private let confirmpasswordTF = UITextField()
    
    private lazy var firststackview: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameContainerView,numberContainerView])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fill
        stack.spacing = 20
        return stack
    }()
    private lazy var secondestackview: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [passwordContainerView,confirmPassContainerView])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fill
        stack.spacing = 20
        return stack
    }()
    private let registerBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "Button 2"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let checkBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "Rectangle 17337"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let conditionLBL: UILabel = {
       let lable = UILabel()
        lable.text = "أوافق على كافة الشرط والاحكام"
        lable.font = UIFont(name: "Tajawal-Regular", size: 15)
        lable.textColor = UIColor(white: 1, alpha: 1)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
           
    // MARK: - Life Cycle
          
       override init(frame: CGRect) {
           super.init(frame: frame)
              configUI()
              
       }
       override func layoutSubviews() {
           super.layoutSubviews()
           backImg.layer.zPosition = 1
           registerLBL.layer.zPosition = 1.1
           firststackview.layer.zPosition = 1.2
           secondestackview.layer.zPosition = 1.3
           registerBtn.layer.zPosition = 1.4
           checkBtn.layer.zPosition = 1.5
           conditionLBL.layer.zPosition = 1.6
           
           
       }
          
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    // MARK: - Helper functions
          func configUI(){
              backgroundColor = .black
              configsubViews()
              configConstraints()
          }
          func configsubViews(){
              addSubview(containerImg)
              addSubview(logo)
              addSubview(backImg)
              addSubview(registerLBL)
              addSubview(firststackview)
              addSubview(secondestackview)
              addSubview(registerBtn)
              addSubview(checkBtn)
              addSubview(conditionLBL)
          }
       func configConstraints(){
           let containerImgConstraints = [
               containerImg.topAnchor.constraint(equalTo: topAnchor),
               containerImg.leadingAnchor.constraint(equalTo: leadingAnchor),
               containerImg.bottomAnchor.constraint(equalTo: bottomAnchor),
               containerImg.trailingAnchor.constraint(equalTo: trailingAnchor),
           ]
           let logoconstraint = [
               logo.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
               logo.centerXAnchor.constraint(equalTo: centerXAnchor),
               logo.widthAnchor.constraint(equalToConstant: 180),
               logo.heightAnchor.constraint(equalToConstant: 210),
           ]
           let backImgConstraints = [
               backImg.topAnchor.constraint(equalTo: logo.bottomAnchor),
               backImg.leadingAnchor.constraint(equalTo: leadingAnchor),
               backImg.bottomAnchor.constraint(equalTo: bottomAnchor),
               backImg.trailingAnchor.constraint(equalTo: trailingAnchor),
           ]
           let registerLBLConstraints = [
               registerLBL.topAnchor.constraint(equalTo: logo.bottomAnchor,constant: 80),
               registerLBL.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -22),
           ]
           
           let firststackviewConstraint = [
               firststackview.topAnchor.constraint(equalTo: registerLBL.bottomAnchor,constant: 30),
               firststackview.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 22),
               firststackview.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -22)
           ]
           let secondstackviewConstraint = [
               secondestackview.topAnchor.constraint(equalTo: firststackview.bottomAnchor,constant: 50),
               secondestackview.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 22),
               secondestackview.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -22)
           ]
           let checkBtnConstraint = [
               checkBtn.topAnchor.constraint(equalTo: secondestackview.bottomAnchor,constant: 25),
               checkBtn.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -22),
               checkBtn.heightAnchor.constraint(equalToConstant: 25),
               checkBtn.widthAnchor.constraint(equalToConstant: 24)
           ]
           let conditionLBLConstraint = [
               conditionLBL.trailingAnchor.constraint(equalTo: checkBtn.leadingAnchor,constant: -10),
               conditionLBL.centerYAnchor.constraint(equalTo: checkBtn.centerYAnchor)
          ]
           
           let registerBtnConstraint = [
            registerBtn.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,constant: -20),
            registerBtn.leadingAnchor.constraint(equalTo: leadingAnchor),
            registerBtn.trailingAnchor.constraint(equalTo: trailingAnchor),
            registerBtn.heightAnchor.constraint(equalToConstant: 80),
           ]
           NSLayoutConstraint.activate(containerImgConstraints)
           NSLayoutConstraint.activate(logoconstraint)
           NSLayoutConstraint.activate(backImgConstraints)
           NSLayoutConstraint.activate(registerLBLConstraints)
           NSLayoutConstraint.activate(firststackviewConstraint)
           NSLayoutConstraint.activate(secondstackviewConstraint)
           NSLayoutConstraint.activate(registerBtnConstraint)
           NSLayoutConstraint.activate(checkBtnConstraint)
           NSLayoutConstraint.activate(conditionLBLConstraint)
       }
    

}
