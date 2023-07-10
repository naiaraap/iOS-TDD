//
//  LeilaoTests.swift
//  LeilaoTests
//
//  Created by Ândriu Coelho on 27/04/18.
//  Copyright © 2018 Alura. All rights reserved.
//

import XCTest
@testable import Leilao

class LeilaoTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testShouldInstantiateEmptyOffersList() {
    let leilao = Leilao(descricao: "Playstation 5")
    XCTAssertEqual(0, leilao.lances?.count)
  }
  
  func testShouldInstantiateDescription() {
    let leilao = Leilao(descricao: "Playstation 5")
    XCTAssertEqual("Playstation 5", leilao.descricao)
  }
  
  func testShouldInstantiateImage() {
    let leilao = Leilao(descricao: "Playstation 5", imagem: "ps5.png")
    XCTAssertEqual("ps5.png", leilao.imagem)
  }
  
  func testShouldGetAnOffer() {
    let leilao = Leilao(descricao: "Playstation 5")
    let usuario = Usuario(nome: "José")
    leilao.propoe(lance: Lance(usuario, 2000.0))
    
    
    XCTAssertEqual(1, leilao.lances?.count)
    XCTAssertEqual(2000.0, leilao.lances?.first?.valor)
  }
  
  func testShouldGetMultipleOffers() {
    let leilao = Leilao(descricao: "Playstation 5")
    let usuario1 = Usuario(nome: "José")
    let usuario2 = Usuario(nome: "Maria")
    leilao.propoe(lance: Lance(usuario1, 2000.0))
    leilao.propoe(lance: Lance(usuario2, 3000.0))
    
    XCTAssertEqual(2, leilao.lances?.count)
    XCTAssertEqual(2000.0, leilao.lances?.first?.valor)
    XCTAssertEqual(3000.0, leilao.lances?.last?.valor)
  }
  
  func testShouldGetLastOffer(){
    let leilao = Leilao(descricao: "Playstation 5")
    let usuario1 = Usuario(nome: "José")
    let usuario2 = Usuario(nome: "Maria")
    leilao.propoe(lance: Lance(usuario1, 2000.0))
    leilao.propoe(lance: Lance(usuario2, 3000.0))
    
    XCTAssertEqual(3000.0, leilao.getTheLastOffer(leilao.lances).valor)
    XCTAssertEqual(usuario2, leilao.getTheLastOffer(leilao.lances).usuario)
  }
  
  func testShouldVerifyTwoConsecutiveOffersUsersAsSame(){
    let leilao = Leilao(descricao: "Playstation 5")
    let usuario = Usuario(nome: "José")
    leilao.propoe(lance: Lance(usuario, 2000.0))
    XCTAssertEqual(true, leilao.isTheSameConsecutiveUserOffer(usuario, leilao.lances))
  }
  
  func testShouldVerifyFirstOfferUserAsNotConsecutive() {
    let leilao = Leilao(descricao: "Playstation 5")
    let usuario = Usuario(nome: "José")
    XCTAssertEqual(false, leilao.isTheSameConsecutiveUserOffer(usuario, leilao.lances))
  }
  
  func testShouldVerifyTwoConsecutiveOffersUsersAsDifferent(){
    let leilao = Leilao(descricao: "Playstation 5")
    let usuario = Usuario(nome: "José")
    let maria = Usuario(nome: "Maria")
    leilao.propoe(lance: Lance(usuario, 2000.0))
    XCTAssertEqual(false, leilao.isTheSameConsecutiveUserOffer(maria, leilao.lances))
  }
  
  func testShouldConsidererOfferInvalid() {
    let leilao = Leilao(descricao: "Playstation 5")
    let usuario = Usuario(nome: "José")
    leilao.propoe(lance: Lance(usuario, 2000.0))
    XCTAssertEqual(false, leilao.canMakeOffer(usuario, leilao.lances))
  }
  
  func testShouldConsidererOfferValid() {
    let leilao = Leilao(descricao: "Playstation 5")
    let usuario = Usuario(nome: "José")
    let maria = Usuario(nome: "Maria")
    leilao.propoe(lance: Lance(usuario, 2000.0))
    XCTAssertEqual(true, leilao.canMakeOffer(maria, leilao.lances))
  }
  
  func testShouldConsidererEmptyOfferListAsvalid() {
    let leilao = Leilao(descricao: "Playstation 5")
    let usuario = Usuario(nome: "José")
    XCTAssertEqual(true, leilao.canMakeOffer(usuario, leilao.lances))
  }
  
  func testShouldNotAllowTwoConsecutiveOffersFromTheSameUser() {
    let leilao = Leilao(descricao: "Playstation 5")
    let usuario = Usuario(nome: "José")
    leilao.propoe(lance: Lance(usuario, 2000.0))
    leilao.propoe(lance: Lance(usuario, 3000.0))
    
    XCTAssertEqual(1, leilao.lances?.count)
    XCTAssertEqual(2000.0, leilao.lances?.first?.valor)
  }
  
}
