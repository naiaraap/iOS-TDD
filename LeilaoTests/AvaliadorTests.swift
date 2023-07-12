//
//  AvaliadorTests.swift
//  LeilaoTests
//
//  Created by Naiara de Almeida Pantuza on 06/07/23.
//  Copyright © 2023 Alura. All rights reserved.
//

import XCTest
@testable import Leilao

final class AvaliadorTests: XCTestCase {
  
  var joao: Usuario!
  var jose: Usuario!
  var maria: Usuario!
  var ana: Usuario!
  var pedro: Usuario!
  
  var leiloeiro: Avaliador!

    override func setUpWithError() throws {
      joao = Usuario(nome: "Joao")
      jose = Usuario(nome: "Jose")
      maria = Usuario(nome: "Maria")
      ana = Usuario(nome: "Ana")
      pedro = Usuario(nome: "Pedro")
      
      leiloeiro = Avaliador()
    }

    override func tearDownWithError() throws {
        
    }

  func testShouldGetOffersInAscendingOrder() {
    
    let leilao = Leilao(descricao: "Playstation 4")
    leilao.propoe(lance: Lance(maria, 250.0))
    leilao.propoe(lance: Lance(joao, 300.0))
    leilao.propoe(lance: Lance(jose, 400.0))
    
    leiloeiro.avalia(leilao)
    
    // Validacao
    let maior = 400.0
    let menor = 250.0
    
    XCTAssertEqual(maior, leiloeiro.maiorLance())
    XCTAssertEqual(menor, leiloeiro.menorLance())
  }
  
  func testShouldGetOffersWithOnlyOneOffer() {
    
    let leilao = Leilao(descricao: "Playstation 4")
    leilao.propoe(lance: Lance(maria, 1000.0))
    
    leiloeiro.avalia(leilao)
    
    // Validacao
    // Validacao
    let maior = 1000.0
    let menor = 1000.0
    
    XCTAssertEqual(maior, leiloeiro.maiorLance())
    XCTAssertEqual(menor, leiloeiro.menorLance())
  }
  
  func testsShouldGetThreeBiggestOffers() {
    
    let leilao = CriadorDeLeillao()
      .para(descricao: "Playstation 4")
      .lance(maria, 250.0)
      .lance(joao, 300.0)
      .lance(maria, 400.0)
      .lance(joao, 500.0)
      .lance(maria, 600.0)
      .constroi()
    
    // Validacao
    let maiores = leiloeiro.getTresMaiores(leilao)
    
    XCTAssertEqual(3, maiores.count)
    XCTAssertEqual(600.0, maiores[0].valor)
    XCTAssertEqual(500.0, maiores[1].valor)
    XCTAssertEqual(400.0, maiores[2].valor)
  }
}
