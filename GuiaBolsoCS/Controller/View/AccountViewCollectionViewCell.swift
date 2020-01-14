//
//  AccountViewCollectionViewCell.swift
//  GuiaBolsoCS
//
//  Created by Catia Miranda de Souza on 13/01/20.
//  Copyright © 2020 Catia Miranda de Souza. All rights reserved.
//

import UIKit

class AccountViewCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var contaLabel: UILabel!
    
    @IBOutlet weak var valorApi: UILabel!
    @IBOutlet weak var contaApi: UILabel!
    @IBOutlet weak var agenciaApi: UILabel!
    @IBOutlet weak var agenciaLabel: UILabel!
    @IBOutlet weak var saldoApi: UILabel!
    @IBOutlet weak var bancoApi: UILabel!
    @IBOutlet weak var bancoLabel: UILabel!
    @IBOutlet weak var buttonBack: UIButton!
    @IBOutlet weak var apelidoLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    func accountData(apelido: String, banco: String = "", agencia: String = "", conta: String = ""){
        self.apelidoLabel.text = apelido
        self.bancoLabel.text = banco
        self.agenciaLabel.text = agencia
        self.contaLabel.text = conta
    }
    func labelFix(bancoLabel: String = "Banco", agenciaLabel: String = "Agencia",contaLabel: String = "Conta"){
        self.bancoLabel.text = bancoLabel
        self.agenciaLabel.text = agenciaLabel
        self.contaLabel.text = contaLabel
    }
    func label(celula: AccountViewCollectionViewCell){
        celula.layer.cornerRadius = 8
        celula.cellView.backgroundColor = UIColor.white
        celula.cellView.heightAnchor.constraint(equalToConstant: 150).isActive = true
           
        celula.contentView.layer.cornerRadius = 8
        celula.contentView.layer.borderWidth = 1
        celula.contentView.layer.borderColor = UIColor.clear.cgColor
        celula.contentView.layer.masksToBounds = true
        celula.layer.backgroundColor = UIColor.white.cgColor
        celula.layer.shadowColor = UIColor.gray.cgColor
        celula.layer.shadowOffset = CGSize(width: 0, height: 5)
        celula.layer.shadowRadius = 8
        celula.layer.shadowOpacity = 0.5
        celula.layer.masksToBounds = false
    }
}
