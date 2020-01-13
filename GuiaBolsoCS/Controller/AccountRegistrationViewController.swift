//
//  AccountRegistrationViewController.swift
//  GuiaBolsoCS
//
//  Created by Catia Miranda de Souza on 10/01/20.
//  Copyright © 2020 Catia Miranda de Souza. All rights reserved.
//

import UIKit

class AccountRegistrationViewController: UIViewController,UITextFieldDelegate {
    
    
    
    @IBOutlet weak var tfConta: UITextField! //apelido
    @IBOutlet weak var tfAgencia: UITextField!
    @IBOutlet weak var tfDigito: UITextField!
    @IBOutlet weak var tfAccount: UITextField!
    @IBOutlet weak var viewCadastro: UIView!
    @IBOutlet weak var viewDrop: UIView!
    @IBOutlet weak var btBack: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var viewAccount: UIView!
    
    var dropDown = DropDownButton()
    var arrayApi:Array<Any>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuraDropDown()
        
    }
     // MARK: - Scroll
        @objc func scroll(notification: Notification){
            self.scrollView.contentSize = CGSize(width: self.scrollView.frame.width, height: self.scrollView.frame.height + 30)
        }
    func accessApi(){
        ServiceRegistration().acessarApi { (array) in
            self.arrayApi = array
        }
    }
    
        func configuraDropDown(){
           viewDrop.layer.masksToBounds = true
         
            dropDown.setTitle("Selecione banco", for: .normal)
            dropDown.translatesAutoresizingMaskIntoConstraints = false
            self.viewDrop.addSubview(dropDown)
            
            dropDown.centerXAnchor.constraint(equalTo: self.viewAccount.centerXAnchor, constant: 1).isActive = true
            dropDown.topAnchor.constraint(equalTo: self.viewAccount.topAnchor, constant: 30).isActive = true
            dropDown.widthAnchor.constraint(equalTo: self.tfAgencia.widthAnchor).isActive = true
            dropDown.heightAnchor.constraint(equalToConstant: 50).isActive = true
            dropDown.layer.cornerRadius = 8
            dropDown.layer.borderWidth = 0.5
            dropDown.layer.masksToBounds = true
            
            
            NotificationCenter.default.addObserver(self, selector: #selector(scroll(notification: )), name: UIResponder.keyboardWillShowNotification ,object: nil)
        }
       

        @IBAction func btAdd(_ sender: Any) {
        }
        
        
   
    

}
