//
//  expensesController.swift
//  RAHAL
//
//  Created by ahmed nagi on 27/06/2023.
//

import UIKit

class expensesController: UIViewController {
    // MARK: - Layout
       private let expensesview = expensesView()
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
           view = expensesview
           view.backgroundColor = UIColor(red: 245, green: 246, blue: 248, alpha: 1)
           let titleAttributes = [
               NSAttributedString.Key.foregroundColor: UIColor.darkGray,
               NSAttributedString.Key.font: UIFont(name: "Tajawal-Regular", size: 30)
           ]
           _ = NSAttributedString(string: "مدفوعاتي", attributes: titleAttributes as [NSAttributedString.Key : Any])
           self.navigationController?.navigationBar.titleTextAttributes = titleAttributes as [NSAttributedString.Key : Any]
           self.navigationItem.title = "مدفوعاتي"
           navigationItem.rightBarButtonItem = rightBarBtn
           navigationItem.leftBarButtonItem = leftBarBtn
       }
     

}
