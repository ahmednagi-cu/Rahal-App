//
//  LoginView.swift
//  RAHAL
//
//  Created by ahmed nagi on 26/06/2023.
//

import UIKit

class LoginView: UIView {

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
    private let loginLBL: UILabel = {
       let lable = UILabel()
        lable.text = "تسجيل دخول"
        lable.font = UIFont(name: "Tajawal-Regular", size: 35)
        lable.textColor = UIColor(white: 1, alpha: 1)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
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
    
    private let forgotPassBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("نسيت كلمة المرور ؟", for: .normal)
        btn.titleLabel?.font = UIFont(name: "Tajawal-Regular", size: 25)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    private let loginBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "Button 1"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    private let firsttitle: UILabel = {
       let lable = UILabel()
        lable.text = "لو لم يكن لديك حساب"
        lable.font = UIFont(name: "Tajawal-Regular", size: 18)
        lable.textColor = UIColor(white: 1, alpha: 1)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    private let secondtitle: UILabel = {
       let lable = UILabel()
        lable.text = "يمكنك التسجيل"
        lable.font = UIFont(name: "Tajawal-Regular", size: 18)
        lable.textColor = UIColor(white: 1, alpha: 1)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    private lazy var stackview: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [firsttitle,secondtitle])
        stack.axis = .vertical
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fill
        stack.spacing = 10
        return stack
    }()
    private let registerBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("من هنا", for: .normal)
        btn.titleLabel?.font = UIFont(name: "Tajawal-Regular", size: 22)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
        
 // MARK: - Life Cycle
       
    override init(frame: CGRect) {
        super.init(frame: frame)
           configUI()
           
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        backImg.layer.zPosition = 1
        loginLBL.layer.zPosition = 1.1
        numberContainerView.layer.zPosition = 1.2
        passwordContainerView.layer.zPosition = 1.3
        stackview.layer.zPosition = 1.4
        loginBtn.layer.zPosition = 1.5
        
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
           addSubview(loginLBL)
           addSubview(numberContainerView)
           addSubview(passwordContainerView)
           addSubview(forgotPassBtn)
           addSubview(stackview)
           addSubview(registerBtn)
           addSubview(loginBtn)
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
        let loginLBLConstraints = [
            loginLBL.topAnchor.constraint(equalTo: logo.bottomAnchor,constant: 110),
            loginLBL.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -22),
        ]
        let numbercontainerViewConstraint = [
            numberContainerView.topAnchor.constraint(equalTo: loginLBL.bottomAnchor,constant: 36),
            numberContainerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            numberContainerView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -22),
            numberContainerView.heightAnchor.constraint(equalToConstant: 44)
        ]
        let passwordcontainerViewConstraint = [
            passwordContainerView.topAnchor.constraint(equalTo: numberContainerView.bottomAnchor,constant: 10),
            passwordContainerView.leadingAnchor.constraint(equalTo: numberContainerView.leadingAnchor),
            passwordContainerView.trailingAnchor.constraint(equalTo: numberContainerView.trailingAnchor),
            passwordContainerView.heightAnchor.constraint(equalToConstant: 44)
        ]
        
        let forgotPassBtnConstraint = [
            forgotPassBtn.topAnchor.constraint(equalTo: passwordContainerView.bottomAnchor,constant: 30),
            forgotPassBtn.leadingAnchor.constraint(equalTo: passwordContainerView.leadingAnchor)
        ]
        let stackviewConstraint = [
            stackview.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,constant: -20),
            stackview.centerXAnchor.constraint(equalTo: passwordContainerView.centerXAnchor)
        ]
        let registerBtnConstraint = [
            registerBtn.trailingAnchor.constraint(equalTo: stackview.leadingAnchor),
            registerBtn.lastBaselineAnchor.constraint(equalTo: stackview.lastBaselineAnchor)
        ]
        let loginBtnConstraint = [
            loginBtn.topAnchor.constraint(equalTo: forgotPassBtn.bottomAnchor,constant: 30),
            loginBtn.leadingAnchor.constraint(equalTo: leadingAnchor),
            loginBtn.trailingAnchor.constraint(equalTo: trailingAnchor),
            loginBtn.heightAnchor.constraint(equalToConstant: 80),
        ]
        NSLayoutConstraint.activate(containerImgConstraints)
        NSLayoutConstraint.activate(logoconstraint)
        NSLayoutConstraint.activate(backImgConstraints)
        NSLayoutConstraint.activate(loginLBLConstraints)
        NSLayoutConstraint.activate(numbercontainerViewConstraint)
        NSLayoutConstraint.activate(passwordcontainerViewConstraint)
        NSLayoutConstraint.activate(forgotPassBtnConstraint)
        NSLayoutConstraint.activate(stackviewConstraint)
        NSLayoutConstraint.activate(registerBtnConstraint)
        NSLayoutConstraint.activate(loginBtnConstraint)
    }
}
