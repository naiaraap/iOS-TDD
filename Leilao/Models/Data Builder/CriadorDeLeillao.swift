//
//  CriadorDeLeillao.swift
//  Leilao
//
//  Created by Naiara de Almeida Pantuza on 11/07/23.
//  Copyright © 2023 Alura. All rights reserved.
//

import UIKit

class CriadorDeLeillao: NSObject {
      
      private var leilao: Leilao!
      
      func para(descricao: String) -> Self {
          leilao = Leilao(descricao: descricao)
          return self
      }
      
      func lance(_ usuario: Usuario, _ valor: Double) -> Self {
          leilao.propoe(lance: Lance(usuario, valor))
          return self
      }
      
      func constroi() -> Leilao {
          return leilao
      }
  
}
