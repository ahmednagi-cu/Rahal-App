//
//  UserInfoController.swift
//  RAHAL
//
//  Created by ahmed nagi on 26/06/2023.
//

import UIKit

class UserInfoController: UIViewController {
 // MARK: - Layout
    private var userinfoView = UserInfoView()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        confignavigationBar()
        

    }
    
    // MARK: - Helper functions
    
    func confignavigationBar(){
        view = userinfoView
        let titleAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont(name: "Tajawal-Regular", size: 30)
        ]
        _ = NSAttributedString(string: "الرئيسية", attributes: titleAttributes as [NSAttributedString.Key : Any])
        self.navigationController?.navigationBar.titleTextAttributes = titleAttributes as [NSAttributedString.Key : Any]
        self.navigationItem.title = "الرئيسية"
        let rightBarBtn = UIBarButtonItem(title: "", image: UIImage(named: "menu"), target: self, action: #selector(didShowMenu))
        let leftBarBtn = UIBarButtonItem(title: "", image: UIImage(named: "pin")?.withRenderingMode(.alwaysOriginal), target: self, action: #selector(didback))
        navigationItem.rightBarButtonItem = rightBarBtn
        navigationItem.leftBarButtonItem = leftBarBtn
    }
    // MARK: - Actions
    @objc func didShowMenu(){
//        let sideMenu = SideMenuNavigationController(rootViewController: SideMenuController())
//        self.view.frame.origin.x = sideMenu.view.frame.origin.x - 100
//        SideMenuPresentationStyle.viewSlideOutMenuZoom
//        present(sideMenu, animated: true)
//        print("menu")
    }
    @objc func didback(){
        print("didback")
    }
}

