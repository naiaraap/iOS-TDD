//
//  Avaliador.swift
//  Leilao
//
//  Created by Alura Laranja on 04/05/18.
//  Copyright © 2018 Alura. All rights reserved.
//

import Foundation

class Avaliador {
  private var maiorValor = Double.leastNonzeroMagnitude
  private var menorValor = Double.greatestFiniteMagnitude
  private var tresMaiores = [Lance]()
  
  
  func avalia(_ leilao: Leilao) throws {
    
    if leilao.lances?.count == 0 {
      throw ErrorsEnumeration.AuctionWithoutOffers("Não é possível avaliar um leilão sem ofertas!")
    }
    
    guard let lances = leilao.lances else { return }
    
    for lance in lances {
      if lance.valor > maiorValor {
        maiorValor = lance.valor
      }
      if lance.valor < menorValor {
        menorValor = lance.valor
      }
    }
  }
  
  func maiorLance() -> Double {
    return maiorValor
  }
  
  func menorLance() -> Double {
    return menorValor
  }
  
  func getTresMaiores(_ leilao: Leilao) -> [Lance] {
    guard let offers = leilao.lances else { return [] }
    
    tresMaiores = offers.sorted(by: { (offer1, offer2) -> Bool in
      return offer1.valor > offer2.valor
    })
    
    tresMaiores = Array(tresMaiores.prefix(3))
    return tresMaiores
  }
}
