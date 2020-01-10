//
//  LoginViewController.swift
//  GuiaBolsoCS
//
//  Created by Catia Miranda de Souza on 10/01/20.
//  Copyright © 2020 Catia Miranda de Souza. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func btLogin(_ sender: Any) {
        
          let email = tfEmail.text
            let password = tfPassword.text
            
            //SALVANDO LOCALMENTE
            let emailUser = UserDefaults.standard.string(forKey: "email")
            let passwordUser = UserDefaults.standard.string(forKey: "password")
            
            
            if(emailUser == email){
                if (passwordUser == password) {
                    
                    UserDefaults.standard.set(true, forKey: "Log")
                    UserDefaults.standard.synchronize()
                    
                    //PASSANDO ENTRE TELA
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let controler = storyboard.instantiateViewController(identifier: "tab")
                    present(controler,animated: true,completion: nil)
                    
                }
                
            }
        }
    }
    
    


