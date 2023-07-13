//
//  AddOrderdController.swift
//  RAHAL
//
//  Created by ahmed nagi on 29/06/2023.
//

import UIKit

class AddOrderdController: UIViewController {
    // MARK: - Layout
       private var addorderdView = AddOrderdView()
       private let rightBarBtn: UIBarButtonItem = {
          let btn = UIBarButtonItem()
           btn.image = UIImage(named: "menu")
           btn.tintColor = .darkGray
           return btn
       }()
       private let leftBarBtn: UIBarButtonItem = {
          let btn = UIBarButtonItem()
           btn.image = UIImage(named: "row")
           btn.tintColor = .darkGray
           return btn
       }()
       override func viewDidLoad() {
           super.viewDidLoad()
           confignavigationBar()

       }
    
    // MARK: - Helper functions
    func confignavigationBar(){
        view = addorderdView
        view.backgroundColor = .lightGray
        let titleAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont(name: "Tajawal-Regular", size: 25)
        ]
        _ = NSAttributedString(string: "اضافة طلب", attributes: titleAttributes as [NSAttributedString.Key : Any])
        self.navigationController?.navigationBar.titleTextAttributes = titleAttributes as [NSAttributedString.Key : Any]
        self.navigationItem.title = "اضافة طلب"
        navigationItem.rightBarButtonItem = rightBarBtn
        navigationItem.leftBarButtonItem = leftBarBtn
    }

    

}
