//
//  Account.swift
//  GuiaBolsoCS
//
//  Created by Catia Miranda de Souza on 13/01/20.
//  Copyright © 2020 Catia Miranda de Souza. All rights reserved.
//

import Foundation

class Account{
    
   
    let accountNIckname: String //apelido conta
    let bank: String  //banco
    let agency: Int //agencia
    let accountNumber: Int
    let digit: Int
    let id: Int
    
    init(accountNIckname: String, bank: String, agency: Int, accountNumber: Int, digit: Int,id: Int) {
        self.accountNIckname = accountNIckname
        self.bank = bank
        self.agency = agency
        self.accountNumber = accountNumber
        self.digit = digit
        self.id = id
    }
}
