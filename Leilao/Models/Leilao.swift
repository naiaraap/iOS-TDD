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
  
  func isTheSameConsecutiveUserOffer(_ usuario:Usuario, _ lances:[Lance]?) -> Bool {
    guard let offersList = lances else { return false }
    return offersList.last?.usuario == usuario
  }
  
  func canMakeOffer(_ usuario:Usuario, _ lances:[Lance]?) -> Bool {
    guard let offersList = lances else { return false }
    if isTheSameConsecutiveUserOffer(usuario, offersList) == false {
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
