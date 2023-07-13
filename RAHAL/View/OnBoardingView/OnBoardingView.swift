//
//  OnBoardingView.swift
//  RAHAL
//
//  Created by ahmed nagi on 25/06/2023.
//

import UIKit

class OnBoardingView: UIView {
 // MARK: - Layout
    private let containerImg: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "background")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.alpha = 5
        return image
    }()
    private let background: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "backimg")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    private let logo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let languageBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("عربي", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont(name: "Tajawal-Regular", size: 25)
        btn.backgroundColor = .darkGray
        btn.layer.cornerRadius = 20
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let engLBL: UILabel = {
       let lable = UILabel()
        lable.text = "English"
        lable.font = UIFont(name: "Tajawal-Regular", size: 35)
        lable.textColor = UIColor(white: 1, alpha: 1)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    private let oorLBL: UILabel = {
       let lable = UILabel()
        lable.text = "ˈo͝ordo͞o"
        lable.font = UIFont(name: "Tajawal-Regular", size: 35)
        lable.textColor = UIColor(white: 1, alpha: 1)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    private lazy var stackview: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [engLBL,oorLBL])
        stackview.axis = .vertical
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.spacing = 80
        stackview.distribution = .fill
        return stackview
    }()
 // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        background.layer.zPosition = 1
        languageBtn.layer.zPosition = 2
        stackview.layer.zPosition = 2.1
       
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
        addSubview(background)
        addSubview(logo)
        addSubview(languageBtn)
        addSubview(stackview)
        
      
    }
    func configConstraints(){
        let containerImgConstraints = [
            containerImg.topAnchor.constraint(equalTo: topAnchor),
            containerImg.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerImg.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerImg.trailingAnchor.constraint(equalTo: trailingAnchor),
        ]
        let backgroundConstraints = [
            background.topAnchor.constraint(equalTo: topAnchor),
            background.leadingAnchor.constraint(equalTo: leadingAnchor),
            background.trailingAnchor.constraint(equalTo: trailingAnchor),
            background.bottomAnchor.constraint(equalTo: logo.topAnchor),
           
        ]
        let logo = [
            logo.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            logo.centerXAnchor.constraint(equalTo: centerXAnchor),
            logo.widthAnchor.constraint(equalToConstant: 210),
            logo.heightAnchor.constraint(equalToConstant: 240),
            
        ]
        let languageBtn = [
            languageBtn.centerXAnchor.constraint(equalTo: centerXAnchor),
            languageBtn.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 100),
            languageBtn.heightAnchor.constraint(equalToConstant: 46),
            languageBtn.widthAnchor.constraint(equalToConstant: 170)
        ]
        
        let stackviewconstraint = [
            stackview.topAnchor.constraint(equalTo: self.languageBtn.bottomAnchor,constant: 100),
            stackview.centerXAnchor.constraint(equalTo: self.languageBtn.centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(containerImgConstraints)
        NSLayoutConstraint.activate(backgroundConstraints)
        NSLayoutConstraint.activate(logo)
        NSLayoutConstraint.activate(languageBtn)
        NSLayoutConstraint.activate(stackviewconstraint)
    }
    
    

}

