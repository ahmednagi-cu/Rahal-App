//
//  expensesView.swift
//  RAHAL
//
//  Created by ahmed nagi on 27/06/2023.
//

import UIKit

class expensesView: UIView {
 // MARK: - Layout
    private let Title: UILabel = {
       let lable = UILabel()
        lable.text = "المدفوعات"
        lable.font = UIFont(name: "Tajawal-Regular", size: 18)
        lable.textColor = .darkGray
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    private let expensestableview: UITableView = {
       let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UINib(nibName: expensesCell.identifier, bundle: nil), forCellReuseIdentifier: expensesCell.identifier)
        table.backgroundColor = .clear
        table.showsVerticalScrollIndicator = false
        return table
    }()
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
        expensestableview.delegate = self
        expensestableview.dataSource = self
    }
    func configUI(){
        configsubViews()
        addConstraints()
    }
    func configsubViews(){
        addSubview(Title)
        addSubview(expensestableview)
    }
    func addConstraints(){
        let titleConstraint = [
            Title.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 40),
            Title.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20)
        ]
        let expensestableviewConstraint = [
            expensestableview.topAnchor.constraint(equalTo: Title.bottomAnchor,constant: 30),
            expensestableview.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            expensestableview.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            expensestableview.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ]
        NSLayoutConstraint.activate(titleConstraint)
        NSLayoutConstraint.activate(expensestableviewConstraint)
    }
}

extension expensesView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: expensesCell.identifier, for: indexPath) as? expensesCell else {
            return UITableViewCell()
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
}
