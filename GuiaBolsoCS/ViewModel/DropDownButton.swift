//
//  DropDownButton.swift
//  GuiaBolsoCS
//
//  Created by Catia Miranda de Souza on 13/01/20.
//  Copyright © 2020 Catia Miranda de Souza. All rights reserved.
//

import UIKit

class DropDownButton: UIButton,DropDownProtocol{
    
   
    var dropView = DropDownView()
    var  height = NSLayoutConstraint()
    var isOpen = false
    
    var bancoSelecionado: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
             self.setTitleColor(UIColor.black, for: .normal)

             dropView = DropDownView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
             dropView.delegate = self
             dropView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func dropDownPressed(string: String) {
        self.setTitle(string, for: .normal)
        self.dismissDropDown()
    }
    
    override func didMoveToSuperview() {
        
    }
    
    
    override func draw(_ rect: CGRect) {
        self.superview?.addSubview(dropView)
        self.superview?.bringSubviewToFront(dropView)
        dropView.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        dropView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        dropView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        height = dropView.heightAnchor.constraint(equalToConstant: 0)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
             if isOpen == false{
                 
                 isOpen = true
                 NSLayoutConstraint.deactivate([self.height])
                 
                 if self.dropView.tableView.contentSize.height > 235 {
                     self.height.constant = 235
                 }else{
                     self.height.constant = self.dropView.tableView.contentSize.height
                 }
                 NSLayoutConstraint.activate([self.height])
                 UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.1, options: .curveEaseInOut, animations: {}, completion: nil)
                 
             }else{
                 isOpen = false
                 
                 NSLayoutConstraint.deactivate([self.height])
                 self.height.constant = 0
                 NSLayoutConstraint.activate([self.height])
                 UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.1, options: .curveEaseInOut, animations: {}, completion: nil)
             }
         }
         
         func dismissDropDown(){
             isOpen = false
            NSLayoutConstraint.deactivate([self.height])
            self.height.constant = 0
            NSLayoutConstraint.activate([self.height])
            
             UIView.animate(withDuration: 0.1, delay: 0.1, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.1, options: .curveEaseInOut, animations: {}, completion: nil)
         }
     
     
}

