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
  
  
  func avalia(_ leilao: Leilao) {
    guard let lances = leilao.lances else { return }
    
    for lance in lances {
      if lance.valor > maiorValor {
        maiorValor = lance.valor
      }
      else if lance.valor < menorValor {
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

}
