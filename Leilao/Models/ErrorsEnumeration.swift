//
//  ErrorEnumeration.swift
//  Leilao
//
//  Created by Naiara de Almeida Pantuza on 12/07/23.
//  Copyright © 2023 Alura. All rights reserved.
//

import Foundation

enum ErrorsEnumeration: Error {
    case AuctionWithoutOffers(String)
  
  case invalidInput(String)
  // Outros casos de erro aqui
  
  var localizedDescription: String {
    switch self {
      case .AuctionWithoutOffers(let message):
        return message
      case .invalidInput(let message):
        return message
    }
  }
}

func throwAuctionWithoutOffersError() throws {
  throw ErrorsEnumeration.AuctionWithoutOffers("Não é possível avaliar um leilão sem ofertas!")
}

