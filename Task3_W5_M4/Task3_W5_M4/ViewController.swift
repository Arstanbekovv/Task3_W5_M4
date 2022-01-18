//
//  ViewController.swift
//  Task3_W5_M4
//
//  Created by Aziz on 16/1/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
    private lazy var button: UIButton = {
        let view = UIButton(type: .system)
        view.backgroundColor = .gray
        view.setTitle("Remove", for: .normal)
        view.addTarget(nil, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        view.setTitleColor(.black, for: .normal)
        return view
    }()
    
    private lazy var textField: UITextField = {
        let view = UITextField()
        view.placeholder = "Enter a name to remove"
        view.textAlignment = .center
        return view
    }()
    
    override func viewDidLoad() {
        setupSubView()
    }
    
    private var names = ["AKINA","MAKITA","INIRA","KALINA","MALINA","AKELLA","ALEGGA","SIRENA","RAKETA","ELEKTRA"]
    
    
    private func setupSubView() {
        
        view.addSubview(button)
                button.snp.makeConstraints { make in
                    make.top.equalToSuperview().offset(50)
                    make.right.equalToSuperview()
                    make.height.equalTo(60)
                    make.width.equalToSuperview().dividedBy(3)
                }
                
                view.addSubview(tableView)
                tableView.snp.makeConstraints { make in
                    make.top.equalTo(button.snp.bottom)
                    make.left.right.bottom.equalToSuperview()
                }
                view.addSubview(textField)
                textField.snp.makeConstraints { make in
                    make.left.equalToSuperview()
                    make.top.equalTo(button)
                    make.height.equalTo(60)
                    make.width.equalToSuperview().multipliedBy(0.6)
                    
                }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let cell = TestCell()
        
        cell.titleName.text = names[index]
        cell.backgroundColor = .white
        return cell
    }
    
    @objc func buttonTapped(sender: UIButton) {
        let textName = self.textField.text!
        
        
        if self.names.contains(textName) == true{
            self.names.remove(at: self.names.firstIndex(of: textName)!)
        }
        self.tableView.reloadData()
    }
    
}
