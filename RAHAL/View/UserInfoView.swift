//
//  UserInfoView.swift
//  RAHAL
//
//  Created by ahmed nagi on 27/06/2023.
//

import UIKit

class UserInfoView: UIView {
 // MARK: - Layout
    private let backImg: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "img")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    private let userAvatar: UIImageView = {
        let image = UIImageView()
       // image.backgroundColor = .lightGray
        image.image = UIImage(named: "photo")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 50
        image.contentMode = .scaleAspectFill
        return image
    }()
    private let welcomeTitle: UILabel = {
       let lable = UILabel()
        lable.text = "مرحبا"
        lable.font = UIFont(name: "Tajawal-Regular", size: 18)
        lable.textColor = .darkGray
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    private let usernameTitle: UILabel = {
       let lable = UILabel()
        lable.text = "مصطفي احمد محمد"
        lable.font = UIFont(name: "Tajawal-Regular", size: 25)
        lable.textAlignment = .center
        lable.textColor = .darkGray
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    private lazy var blunceImg: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "blunce")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 50
        image.contentMode = .scaleAspectFill
        image.addSubview(blunceStackview)
        
        return image
    }()
    
    private let blunceTitle: UILabel = {
       let lable = UILabel()
        lable.text = "الرصيد الحالي"
        lable.font = UIFont(name: "Tajawal-Regular", size: 18)
        lable.textColor = .white
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    private let blunceCount: UILabel = {
       let lable = UILabel()
        let attributedtitle = NSMutableAttributedString(string: "105.000",attributes: [NSAttributedString.Key.foregroundColor : UIColor.white,
                                                                                       NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18,weight: .semibold)])
        attributedtitle.append(NSAttributedString(string: " RS",attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 22),NSAttributedString.Key.foregroundColor: UIColor.systemOrange]))
        
        lable.attributedText = attributedtitle
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    private lazy var blunceStackview: UIStackView = {
       let stackview = UIStackView(arrangedSubviews: [blunceTitle,blunceCount])
        stackview.axis = .vertical
        stackview.distribution = .fillEqually
        stackview.spacing = 5
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    private let myorderBtn: UIButton = {
        return UIButton().infoBtn(with: UIImage(named: "myorderd")!)
    }()
    private let personalInfoBtn: UIButton = {
        return UIButton().infoBtn(with: UIImage(named: "personalinfo")!)
    }()
    private let myAccountBtn: UIButton = {
        return UIButton().infoBtn(with: UIImage(named: "account")!)
    }()
    private let addNewOrderBtn: UIButton = {
        return UIButton().infoBtn(with: UIImage(named: "addneworder")!)
    }()
    
    private lazy var infoStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [myorderBtn,personalInfoBtn,myAccountBtn,addNewOrderBtn])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

 // MARK: - Life Cycle
       override init(frame: CGRect) {
           super.init(frame: frame)
            configUI()
              
       }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
 // MARK: - Helper Functions
    func configUI(){
        backgroundColor = .white
        addsubviews()
        configConstraints()
    }
    func addsubviews(){
        addSubview(backImg)
        addSubview(userAvatar)
        addSubview(welcomeTitle)
        addSubview(usernameTitle)
        addSubview(blunceImg)
        addSubview(infoStackView)
        
    }
    func configConstraints(){
        let backgroundConstraints = [
            backImg.topAnchor.constraint(equalTo: topAnchor),
            backImg.leadingAnchor.constraint(equalTo: leadingAnchor,constant: -16),
            backImg.trailingAnchor.constraint(equalTo: trailingAnchor,constant: 14),
            backImg.heightAnchor.constraint(equalToConstant: 220)
        ]
        let useravatarConstraint = [
            userAvatar.centerXAnchor.constraint(equalTo: backImg.centerXAnchor),
            userAvatar.lastBaselineAnchor.constraint(equalTo: backImg.lastBaselineAnchor,constant: 20),
            userAvatar.widthAnchor.constraint(equalToConstant: 100),
            userAvatar.heightAnchor.constraint(equalToConstant: 100),
        ]
       let welcomeTitleConstraint = [
        welcomeTitle.topAnchor.constraint(equalTo: userAvatar.bottomAnchor),
        welcomeTitle.centerXAnchor.constraint(equalTo: userAvatar.centerXAnchor)
       ]
       let usernameTitleConstraint = [
        usernameTitle.topAnchor.constraint(equalTo: welcomeTitle.bottomAnchor,constant: 5),
        usernameTitle.centerXAnchor.constraint(equalTo: userAvatar.centerXAnchor),
        ]
        let blunceImgConstraint = [
            blunceImg.topAnchor.constraint(equalTo: usernameTitle.bottomAnchor,constant: 30),
            blunceImg.heightAnchor.constraint(equalToConstant: 104),
            blunceImg.widthAnchor.constraint(equalToConstant: 284),
            blunceImg.centerXAnchor.constraint(equalTo: centerXAnchor)
        ]
        let blunceStackviewConstraint = [
            blunceStackview.centerXAnchor.constraint(equalTo: blunceImg.centerXAnchor),
            blunceStackview.centerYAnchor.constraint(equalTo: blunceImg.centerYAnchor)
        ]
        let infoStackViewConstraint = [
            infoStackView.topAnchor.constraint(equalTo: blunceImg.bottomAnchor,constant: 30),
            infoStackView.centerXAnchor.constraint(equalTo: blunceImg.centerXAnchor),
            infoStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,constant: -10)
        ]
        NSLayoutConstraint.activate(backgroundConstraints)
        NSLayoutConstraint.activate(useravatarConstraint)
        NSLayoutConstraint.activate(welcomeTitleConstraint)
        NSLayoutConstraint.activate(usernameTitleConstraint)
        NSLayoutConstraint.activate(blunceImgConstraint)
        NSLayoutConstraint.activate(blunceStackviewConstraint)
        NSLayoutConstraint.activate(infoStackViewConstraint)
       
    }
    

}
