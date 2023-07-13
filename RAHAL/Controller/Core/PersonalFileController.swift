//
//  PersonalFileController.swift
//  RAHAL
//
//  Created by ahmed nagi on 27/06/2023.
//

import UIKit

class PersonalFileController: UIViewController {
  // MARK: - Layout
      private let personalFileView = PersonalFileView()
       private let rightBarBtn: UIBarButtonItem = {
          let btn = UIBarButtonItem()
           btn.image = UIImage(named: "menu")
           return btn
       }()
       private let leftBarBtn: UIBarButtonItem = {
          let btn = UIBarButtonItem()
           btn.image = UIImage(named: "row")?.withRenderingMode(.alwaysOriginal)
           return btn
       }()
       override func viewDidLoad() {
           super.viewDidLoad()
          
           confignavigationBar()

       }
       
       // MARK: - Helper functions
       func confignavigationBar(){
           view = personalFileView
           let titleAttributes = [
               NSAttributedString.Key.foregroundColor: UIColor.white,
               NSAttributedString.Key.font: UIFont(name: "Tajawal-Regular", size: 30)
           ]
           _ = NSAttributedString(string: "الملف الشخصي", attributes: titleAttributes as [NSAttributedString.Key : Any])
           self.navigationController?.navigationBar.titleTextAttributes = titleAttributes as [NSAttributedString.Key : Any]
           self.navigationItem.title = "الملف الشخصي"
           navigationItem.rightBarButtonItem = rightBarBtn
           navigationItem.leftBarButtonItem = leftBarBtn
       }

}
