//
//  ErrorsEnumerationTests.swift
//  LeilaoTests
//
//  Created by Naiara de Almeida Pantuza on 12/07/23.
//  Copyright © 2023 Alura. All rights reserved.
//

import XCTest
@testable import Leilao

final class ErrorsEnumerationTests: XCTestCase {

  func testShouldInitErrorsEnumeration() {
    XCTAssertThrowsError(try throwAuctionWithoutOffersError()) { error in
      let expectedErrorMessage = "Não é possível avaliar um leilão sem ofertas!"
      XCTAssertEqual((error as? ErrorsEnumeration)?.localizedDescription, expectedErrorMessage)
    }
  
  }

}
