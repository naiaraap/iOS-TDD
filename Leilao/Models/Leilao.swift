//
//  Leilao.swift
//  Leilao
//
//  Created by Ândriu Coelho on 27/04/18.
//  Copyright © 2018 Alura. All rights reserved.
//

import Foundation

class Leilao {
    
    let descricao:String
    let imagem:String?
    var lances:[Lance]?
    
    init(descricao:String, imagem:String? = nil, lances:[Lance] = []) {
        self.descricao = descricao
        self.imagem = imagem
        self.lances = lances
    }
  
  func getTheLastOffer(_ lances: [Lance]?) -> Lance {
    guard let offersList = lances else { return Lance(Usuario(nome: ""), 0) }
    if offersList.isEmpty {
      return Lance(Usuario(nome: ""), 0) }
    
    return offersList[offersList.count - 1]
  }
  
  func isTheSameConsecutiveUserOffer(_ usuario:Usuario, _ lances:[Lance]?) -> Bool {
    guard let offersList = lances else { return false }
    return getTheLastOffer(offersList).usuario == usuario
  }
  
  func getNumberOfOffersByUser(_ usuario: Usuario) -> Int {
    guard let offersList = lances else { return 0 }
    return offersList.filter({ $0.usuario == usuario }).count
  }
  
  func canMakeOffer(_ usuario:Usuario, _ lances:[Lance]?) -> Bool {
    guard let offersList = lances else { return false }
    if isTheSameConsecutiveUserOffer(usuario, offersList) == false && getNumberOfOffersByUser(usuario) < 5 {
      return true
    }
    return false
  }
    
    func propoe(lance:Lance) {
      guard let offersList = lances else { return }
      if canMakeOffer(lance.usuario, offersList) {
        lances?.append(lance)
      }
    }
}
