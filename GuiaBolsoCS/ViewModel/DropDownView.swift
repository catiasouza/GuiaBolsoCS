//
//  DropDownView.swift
//  GuiaBolsoCS
//
//  Created by Catia Miranda de Souza on 13/01/20.
//  Copyright © 2020 Catia Miranda de Souza. All rights reserved.
//

import UIKit

class DropDownView: UIView, UITableViewDelegate, UITableViewDataSource{

    var dropDownOptions = [String]()
    var tableView = UITableView()
    var delegate: DropDownProtocol!
    
    
     //MARK: - Inicializadores
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        dropDownOptions = ["ÄAAAA","ÄAAAA","ÄAAAA","ÄAAAA"]
        tableView.backgroundColor = UIColor.black
        self.backgroundColor = UIColor.black
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(tableView)
        
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    
    }
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dropDownOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = dropDownOptions[indexPath.row]
        
        cell.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1)
        cell.textLabel?.textColor = UIColor.black
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           self.delegate.dropDownPressed(string: dropDownOptions[indexPath.row])
           
           
       }
       
       override func draw(_ rect: CGRect) {
           tableView.reloadData()
       }
   
}
    
    

