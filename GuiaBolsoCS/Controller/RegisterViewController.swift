//
//  RegisterViewController.swift
//  GuiaBolsoCS
//
//  Created by Catia Miranda de Souza on 10/01/20.
//  Copyright © 2020 Catia Miranda de Souza. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var tfRegisterRepeat: UITextField!
    @IBOutlet weak var tfRegisterPassword: UITextField!
    @IBOutlet weak var tfRegisterEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    

    @IBAction func btRegister(_ sender: Any) {
        let email = tfRegisterEmail.text
               let password = tfRegisterPassword.text
               let passwordRepeat = tfRegisterRepeat.text
               
               // CHECK FOR EMPTY FIELDS
               if (email!.isEmpty || password!.isEmpty){
                   alertMessage(message: "Preencha todos os campos!")
                   return
               }
               if(password! != passwordRepeat!){
                   alertMessage(message: "Senha não confere")
                   return
               }
               
               //STORE DATA
               UserDefaults.standard.set(email, forKey:"email")
               UserDefaults.standard.set(password, forKey:"password")
               UserDefaults.standard.synchronize()
               
               var alert = UIAlertController(title: "Alert", message: "Registro com sucesso.", preferredStyle: .alert)
               let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                   
                   self.dismiss(animated: true, completion: nil)
               }
               alert.addAction(okAction)
               self.present(alert, animated: true, completion: nil)
           }
           func alertMessage(message: String){
               var alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
               let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
               alert.addAction(okAction)
               self.present(alert, animated: true, completion: nil)
           }
    }
    


