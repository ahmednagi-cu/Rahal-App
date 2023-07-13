//
//  SideMenuController.swift
//  RAHAL
//
//  Created by ahmed nagi on 27/06/2023.
//

import UIKit

class SideMenuController: UIViewController {
  // MARK: - Layout
     private let containerImg: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "background")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.alpha = 5
        return image
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
         configUI()
       
        
    }
    

 // MARK: - Helper Functions
    func configUI(){
        view.backgroundColor = .black
        configsubViews()
        configConstraints()
    }
    func configsubViews(){
        view.addSubview(containerImg)
    }
    func configConstraints(){
        let containerImgConstraints = [
            containerImg.topAnchor.constraint(equalTo: view.topAnchor),
            containerImg.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerImg.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            containerImg.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ]
        NSLayoutConstraint.activate(containerImgConstraints)
   }
}
