//
//  MyOrderdController.swift
//  RAHAL
//
//  Created by ahmed nagi on 27/06/2023.
//

import UIKit

class MyOrderdController: UIViewController {
 // MARK: - Layout
    private lazy var rightBarBtn: UIBarButtonItem = {
          let btn = UIBarButtonItem()
           btn.image = UIImage(named: "menu")
           btn.tintColor = .darkGray
           return btn
       }()
    private lazy var leftBarBtn: UIBarButtonItem = {
          let btn = UIBarButtonItem()
           btn.image = UIImage(named: "row")
           btn.tintColor = .darkGray
           return btn
       }()
    private lazy var titleView: UIView = {
        let titleview = UIView()
        titleview.backgroundColor = .white
        titleview.translatesAutoresizingMaskIntoConstraints = false
        titleview.addSubview(sectionStackView)
        sectionStackView.centerXAnchor.constraint(equalTo: titleview.centerXAnchor).isActive = true
        sectionStackView.centerYAnchor.constraint(equalTo: titleview.centerYAnchor).isActive = true
       return titleview
    }()
   
    private var selectedTab: Int = 1 {
        didSet {
            for i in 0..<tabs.count {
                UIView.animate(withDuration: 0.3, delay: 0,options: .curveEaseInOut) { [weak self] in
                    self?.sectionStackView.arrangedSubviews[i].tintColor = i == self?.selectedTab ? .black : .systemBlue
                    self?.trallingAnchors[i].isActive = i == self?.selectedTab ? false : true
                    self?.leadingAnchors[i].isActive = i == self?.selectedTab ? false : true
                    //self?.titleView.layoutI0fNeeded()
                }
            }
            print(selectedTab)
        }
    }
    private lazy var tabs: [UIButton] = ["طلبات قائمة","طلبات منتهية"]
        .map { buttonTitle in
        let button = UIButton(type: .system)
        button.setTitle(buttonTitle, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        button.tintColor = .black
        button.titleLabel?.textAlignment = .right
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    private enum SectionTabs: String {
        case stayOrderd = "طلبات قائمة"
        case finshingOrderd = "طلبات منتهية"
        var index: Int {
            switch self {
            case .finshingOrderd:
               return 0
            case .stayOrderd:
               return 1
             
            }
        }
    }
    private lazy var sectionStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: tabs)
        stackview.axis = .horizontal
        stackview.distribution = .equalSpacing
        stackview.alignment = .center
        stackview.spacing = view.frame.width  / 4
        stackview.translatesAutoresizingMaskIntoConstraints = false
         return stackview
    }()
    
    private var leadingAnchors: [NSLayoutConstraint] = []
    private var trallingAnchors: [NSLayoutConstraint] = []
    private let indicator: UIView = {
        let indicator = UIView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.backgroundColor = .systemBlue
        return indicator
    }()
   
    private let myorderdtableview: UITableView = {
       let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UINib(nibName: MyOrderdCell.identifier, bundle: nil), forCellReuseIdentifier:  MyOrderdCell.identifier)
        table.backgroundColor = .systemGray6
        table.showsVerticalScrollIndicator = false
        return table
    }()
    
       override func viewDidLoad() {
           super.viewDidLoad()
           configUI()
           confignavigationBar()
           configCell()
           configButton()
       }
       
 // MARK: - Actions
    private func configButton(){
        for (i, button) in sectionStackView.arrangedSubviews.enumerated(){
            guard let button = button as? UIButton else { return }
            
            if i == selectedTab {
                button.tintColor = .systemBlue
            }else {
                button.tintColor = .black
            }
            button.addTarget(self, action: #selector(didTapTap(_:)), for: .touchUpInside)
        }
    }
    @objc func didTapTap(_ sender: UIButton){
        guard let lable = sender.titleLabel?.text else { return }
        
        switch lable {
        case SectionTabs.finshingOrderd.rawValue:
            selectedTab = 0
        case SectionTabs.stayOrderd.rawValue:
            selectedTab = 1
        default:
            selectedTab = 0
        }
    
           print(sender.titleLabel?.text ?? "")
    }
// MARK: - Helper functions
    func configCell(){
        myorderdtableview.delegate = self
        myorderdtableview.dataSource = self
    }
    
       func confignavigationBar(){
           view.backgroundColor = .systemGray6 //UIColor(red: 245, green: 246, blue: 248, alpha: 1)
           let titleAttributes = [
               NSAttributedString.Key.foregroundColor: UIColor.darkGray,
               NSAttributedString.Key.font: UIFont(name: "Tajawal-Regular", size: 30)
           ]
           _ = NSAttributedString(string: "طلباتي", attributes: titleAttributes as [NSAttributedString.Key : Any])
           self.navigationController?.navigationBar.titleTextAttributes = titleAttributes as [NSAttributedString.Key : Any]
           self.navigationItem.title = "طلباتي"
           navigationItem.rightBarButtonItem = rightBarBtn
           navigationItem.leftBarButtonItem = leftBarBtn
       }
    
     func configUI(){
        configsubViews()
        addConstraints()
     }
      func configsubViews(){
          view.addSubview(myorderdtableview)
          view.addSubview(titleView)
          view.addSubview(indicator)
      }
    func addConstraints(){
        
        for i in 0..<tabs.count {
            let leading = indicator.leadingAnchor.constraint(equalTo: sectionStackView.arrangedSubviews[i].leadingAnchor)
            leadingAnchors.append(leading)
            let tralling = indicator.trailingAnchor.constraint(equalTo: sectionStackView.arrangedSubviews[i].trailingAnchor)
            trallingAnchors.append(tralling)
        }
        let titleViewConstraint = [
            titleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20),
            titleView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            titleView.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        let myorderdtableviewConstraint = [
            myorderdtableview.topAnchor.constraint(equalTo: titleView.bottomAnchor,constant: 30),
            myorderdtableview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myorderdtableview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            myorderdtableview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        
        let indicatorConstraint = [
            leadingAnchors[1],
            trallingAnchors[1],
            indicator.topAnchor.constraint(equalTo: sectionStackView.arrangedSubviews[1].bottomAnchor),
            indicator.heightAnchor.constraint(equalToConstant: 4)
        ]
        NSLayoutConstraint.activate(titleViewConstraint)
        NSLayoutConstraint.activate(indicatorConstraint)
        NSLayoutConstraint.activate(myorderdtableviewConstraint)
    }

}


extension MyOrderdController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyOrderdCell.identifier, for: indexPath) as? MyOrderdCell else {
            return UITableViewCell()
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    
}
