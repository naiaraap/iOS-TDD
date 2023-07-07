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

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }

  func testShouldGetOffersInAscendingOrder() {
    // Cenario
    let joao = Usuario(nome: "Joao")
    let jose = Usuario(nome: "Jose")
    let maria = Usuario(nome: "Maria")
    
    let leilao = Leilao(descricao: "Playstation 4")
    leilao.propoe(lance: Lance(maria, 250.0))
    leilao.propoe(lance: Lance(joao, 300.0))
    leilao.propoe(lance: Lance(jose, 400.0))
    
    // Acao
    let leiloeiro = Avaliador()
    leiloeiro.avalia(leilao)
    
    // Validacao
    let maior = 400.0
    let menor = 250.0
    
    XCTAssertEqual(maior, leiloeiro.maiorLance())
    XCTAssertEqual(menor, leiloeiro.menorLance())
  }
  
  func testShouldGetOffersWithOnlyOneOffer() {
    // Cenario
    let maria = Usuario(nome: "Maria")
    
    let leilao = Leilao(descricao: "Playstation 4")
    leilao.propoe(lance: Lance(maria, 1000.0))
    
    // Acao
    let leiloeiro = Avaliador()
    leiloeiro.avalia(leilao)
    
    // Validacao
    // Validacao
    let maior = 1000.0
    let menor = 1000.0
    
    XCTAssertEqual(maior, leiloeiro.maiorLance())
    XCTAssertEqual(menor, leiloeiro.menorLance())
  }
  
  func testsShouldGetThreeBiggestOffers() {
    // Cenario
    let joao = Usuario(nome: "Joao")
    let jose = Usuario(nome: "Jose")
    let maria = Usuario(nome: "Maria")
    let ana = Usuario(nome: "Ana")
    let pedro = Usuario(nome: "Pedro")
    
    
    let leilao = Leilao(descricao: "Playstation 4")
    leilao.propoe(lance: Lance(maria, 250.0))
    leilao.propoe(lance: Lance(joao, 300.0))
    leilao.propoe(lance: Lance(jose, 400.0))
    leilao.propoe(lance: Lance(ana, 500.0))
    leilao.propoe(lance: Lance(pedro, 600.0))
    
    // Acao
    let leiloeiro = Avaliador()
    
    // Validacao
    let maiores = leiloeiro.getTresMaiores(leilao)
    
    XCTAssertEqual(3, maiores.count)
    XCTAssertEqual(600.0, maiores[0].valor)
    XCTAssertEqual(500.0, maiores[1].valor)
    XCTAssertEqual(400.0, maiores[2].valor)
  }
  

}
