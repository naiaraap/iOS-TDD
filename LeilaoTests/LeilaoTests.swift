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
  
  private var usuario: Usuario!
  private var maria: Usuario!
  
  override func setUp() {
    super.setUp()
    maria = Usuario(nome: "Maria")
    usuario = Usuario(nome: "José")
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
    leilao.propoe(lance: Lance(usuario, 2000.0))
    
    
    XCTAssertEqual(1, leilao.lances?.count)
    XCTAssertEqual(2000.0, leilao.lances?.first?.valor)
  }
  
  func testShouldGetMultipleOffers() {
    let leilao = Leilao(descricao: "Playstation 5")
    leilao.propoe(lance: Lance(usuario, 2000.0))
    leilao.propoe(lance: Lance(maria, 3000.0))
    
    XCTAssertEqual(2, leilao.lances?.count)
    XCTAssertEqual(2000.0, leilao.lances?.first?.valor)
    XCTAssertEqual(3000.0, leilao.lances?.last?.valor)
  }
  
  func testShouldGetLastOffer(){
    let leilao = Leilao(descricao: "Playstation 5")
    leilao.propoe(lance: Lance(usuario, 2000.0))
    leilao.propoe(lance: Lance(maria, 3000.0))
    
    XCTAssertEqual(3000.0, leilao.getTheLastOffer(leilao.lances).valor)
    XCTAssertEqual(maria, leilao.getTheLastOffer(leilao.lances).usuario)
  }
  
  func testShouldVerifyTwoConsecutiveOffersUsersAsSame(){
    let leilao = Leilao(descricao: "Playstation 5")
    leilao.propoe(lance: Lance(usuario, 2000.0))
    XCTAssertEqual(true, leilao.isTheSameConsecutiveUserOffer(usuario, leilao.lances))
  }
  
  func testShouldVerifyFirstOfferUserAsNotConsecutive() {
    let leilao = Leilao(descricao: "Playstation 5")
    XCTAssertEqual(false, leilao.isTheSameConsecutiveUserOffer(usuario, leilao.lances))
  }
  
  func testShouldIgnoreMoreThanFiveOffersBySameUser() {
    let leilao = Leilao(descricao: "Playstation 5")
    
    leilao.propoe(lance: Lance(usuario, 2000.0))
    leilao.propoe(lance: Lance(maria, 2500.0))
    
    leilao.propoe(lance: Lance(usuario, 3000.0))
    leilao.propoe(lance: Lance(maria, 3500.0))
    
    leilao.propoe(lance: Lance(usuario, 4000.0))
    leilao.propoe(lance: Lance(maria, 4500.0))
    
    leilao.propoe(lance: Lance(usuario, 5000.0))
    leilao.propoe(lance: Lance(maria, 5500.0))
    
    leilao.propoe(lance: Lance(usuario, 6000.0))
    leilao.propoe(lance: Lance(maria, 6500.0))
    
    leilao.propoe(lance: Lance(usuario, 7000.0))
    
    XCTAssertEqual(10, leilao.lances?.count)
    XCTAssertEqual(6500.0, leilao.lances?.last?.valor)
  }
  
  func testShouldVerifyTwoConsecutiveOffersUsersAsDifferent(){
    let leilao = Leilao(descricao: "Playstation 5")
    leilao.propoe(lance: Lance(usuario, 2000.0))
    XCTAssertEqual(false, leilao.isTheSameConsecutiveUserOffer(maria, leilao.lances))
  }
  
  func testShouldConsidererOfferInvalid() {
    let leilao = Leilao(descricao: "Playstation 5")
    leilao.propoe(lance: Lance(usuario, 2000.0))
    XCTAssertEqual(false, leilao.canMakeOffer(usuario, leilao.lances))
  }
  
  func testShouldConsidererOfferValid() {
    let leilao = Leilao(descricao: "Playstation 5")
    leilao.propoe(lance: Lance(usuario, 2000.0))
    XCTAssertEqual(true, leilao.canMakeOffer(maria, leilao.lances))
  }
  
  func testShouldConsidererEmptyOfferListAsvalid() {
    let leilao = Leilao(descricao: "Playstation 5")
    XCTAssertEqual(true, leilao.canMakeOffer(usuario, leilao.lances))
  }
  
  func testShouldNotAllowTwoConsecutiveOffersFromTheSameUser() {
    let leilao = Leilao(descricao: "Playstation 5")
    leilao.propoe(lance: Lance(usuario, 2000.0))
    leilao.propoe(lance: Lance(usuario, 3000.0))
    
    XCTAssertEqual(1, leilao.lances?.count)
    XCTAssertEqual(2000.0, leilao.lances?.first?.valor)
  }
  
  func testShouldGetFourOffersByUser() {
    let leilao = Leilao(descricao: "Playstation 5")
    leilao.propoe(lance: Lance(usuario, 2000.0))
    leilao.propoe(lance: Lance(maria, 3000.0))
    
    leilao.propoe(lance: Lance(usuario, 4000.0))
    leilao.propoe(lance: Lance(maria, 5000.0))
    
    leilao.propoe(lance: Lance(usuario, 6000.0))
    leilao.propoe(lance: Lance(maria, 7000.0))
    
    leilao.propoe(lance: Lance(usuario, 8000.0))
    leilao.propoe(lance: Lance(maria, 9000.0))
    
    XCTAssertEqual(4, leilao.getNumberOfOffersByUser(maria))
  }
  
}
