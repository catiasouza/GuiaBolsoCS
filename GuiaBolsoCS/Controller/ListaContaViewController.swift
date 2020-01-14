//
//  ListaContaViewController.swift
//  GuiaBolsoCS
//
//  Created by Catia Miranda de Souza on 10/01/20.
//  Copyright © 2020 Catia Miranda de Souza. All rights reserved.
//

import UIKit
import CoreData

class ListaContaViewController: UIViewController,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource, NSFetchedResultsControllerDelegate{
    
    @IBOutlet weak var search: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var fetchResultController: NSFetchedResultsController<AccountCD>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        retrieveAccount()
    }
    
    //MARK: - CollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //        if fetchResultController.fetchedObjects?.count != 0{
        return fetchResultController.fetchedObjects!.count
        //        }else{
        //            return 1
        //        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! AccountViewCollectionViewCell
        let contaSelecionada = fetchResultController.fetchedObjects?[indexPath.row]
        
        let apelido = contaSelecionada?.accountNickname!
        let banco = contaSelecionada?.bank
        let agencia = contaSelecionada?.agency
        let contaNum = "\(String(describing: contaSelecionada!.account))" + "-" + "\(String(describing: contaSelecionada!.digit))"
        
        //MOSTRAR DADOS
        cell.contaLabel.text = contaNum
        cell.bancoLabel.text = banco
        cell.agenciaLabel.text = "\(String(describing: agencia))"
        
        return cell
    }
    //Passagem para extrato
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "extrato")
        present(controller, animated: true, completion: nil)
    }
    
    //configura tamanho celula
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let largura = collectionView.bounds.width
        let altura:CGFloat = 140
        
        return CGSize(width: largura, height: altura)
    }
    //Recuperar conta
    func retrieveAccount(filtro: String = ""){
        let fetchRequest: NSFetchRequest<AccountCD> = AccountCD.fetchRequest()
        fetchRequest.sortDescriptors = []
        
        //        if filtro != ""{
        //            let predicate = NSPredicate(format: "apelidoConta contains [c]%@", filtro)
        //            fetchRequest.predicate = predicate
        fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        fetchResultController.delegate = self
        do {
            try fetchResultController.performFetch()
            //                arraySaldos = recuperaSaldo()
            //                somaSaldos = somaSaldosMetodo(saldosArray: arraySaldos)
            //                labelSaldoTotal.text = "R$ \( SetupModel().formatarValor(valor: somaSaldos) )"
        } catch  {
            print(error.localizedDescription)
        }
    }
}
