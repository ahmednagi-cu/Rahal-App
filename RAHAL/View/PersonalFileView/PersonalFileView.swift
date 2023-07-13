//
//  PersonalFileView.swift
//  RAHAL
//
//  Created by ahmed nagi on 27/06/2023.
//

import UIKit

class PersonalFileView: UIView {
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
    private let backgroundImg: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Path 8810")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    private let personalinfotableview: UITableView = {
       let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UINib(nibName: personalFileCell.identifier, bundle: nil), forCellReuseIdentifier: personalFileCell.identifier)
        return table
    }()
    private let logoutBtn: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logout")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    private let logoutTitle: UILabel = {
       let lable = UILabel()
        lable.text = "تسجيل الخروج"
        lable.font = UIFont(name: "Tajawal-Regular", size: 18)
        lable.textColor = .red
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    // MARK: - Life Cycle
        override init(frame: CGRect) {
            super.init(frame: frame)
               configUI()
               configCell()
          }
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
    // MARK: - Helper Functions
      func configCell(){
          personalinfotableview.delegate = self
          personalinfotableview.dataSource = self
      }
       func configUI(){
           backgroundColor = .white
           personalinfotableview.layer.zPosition = 1
           logoutBtn.layer.zPosition = 1.1
           logoutTitle.layer.zPosition = 1.2
           addsubviews()
           configConstraints()
       }
       func addsubviews(){
           addSubview(backImg)
           addSubview(userAvatar)
           addSubview(welcomeTitle)
           addSubview(usernameTitle)
           addSubview(backgroundImg)
           addSubview(personalinfotableview)
           addSubview(logoutBtn)
           addSubview(logoutTitle)
           
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
           let backgroundImgConstraint = [
               backgroundImg.topAnchor.constraint(equalTo: usernameTitle.bottomAnchor,constant: 40),
               backgroundImg.leadingAnchor.constraint(equalTo: leadingAnchor,constant: -28),
               backgroundImg.trailingAnchor.constraint(equalTo: trailingAnchor,constant: 28),
               backgroundImg.bottomAnchor.constraint(equalTo: bottomAnchor)
           ]
           let personalinfotableviewConstraint = [
            personalinfotableview.topAnchor.constraint(equalTo: usernameTitle.bottomAnchor,constant: 160),
            personalinfotableview.leadingAnchor.constraint(equalTo: leadingAnchor),
            personalinfotableview.trailingAnchor.constraint(equalTo: trailingAnchor),
            personalinfotableview.heightAnchor.constraint(equalToConstant: 180)
           ]
           let logoutBtnConstraint = [
            logoutBtn.topAnchor.constraint(equalTo: personalinfotableview.bottomAnchor,constant: 40),
            logoutBtn.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -40),
            logoutBtn.heightAnchor.constraint(equalToConstant: 15),
            logoutBtn.widthAnchor.constraint(equalToConstant: 20)
           ]
           
           let logoutTitleConstraint = [
            logoutTitle.trailingAnchor.constraint(equalTo: logoutBtn.leadingAnchor,constant: -20),
            logoutTitle.centerYAnchor.constraint(equalTo: logoutBtn.centerYAnchor)
           ]
           NSLayoutConstraint.activate(backgroundConstraints)
           NSLayoutConstraint.activate(useravatarConstraint)
           NSLayoutConstraint.activate(welcomeTitleConstraint)
           NSLayoutConstraint.activate(usernameTitleConstraint)
           NSLayoutConstraint.activate(backgroundImgConstraint)
           NSLayoutConstraint.activate(personalinfotableviewConstraint)
           NSLayoutConstraint.activate(logoutBtnConstraint)
           NSLayoutConstraint.activate(logoutTitleConstraint)
       }
       

   }
extension PersonalFileView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: personalFileCell.identifier, for: indexPath) as? personalFileCell else {
            return UITableViewCell()
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}


