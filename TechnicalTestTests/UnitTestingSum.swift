//
//  UnitTestingSum.swift
//  TechnicalTest
//
//  Created by Lisette HG on 05/04/24.
//

import XCTest
@testable import TechnicalTest // Cambia `YourProjectName` por el nombre de tu proyecto.

class UnitTestingSum: XCTestCase {

    func testSumOfEvenNumbersWithAllEvens() {
        // Caso de prueba con todos los números pares
        XCTAssertEqual(sumOfEvenNumbers(in: [2, 4, 6, 8]), 20, "La suma de números pares debería ser 20")
    }

    func testSumOfEvenNumbersWithAllOdds() {
        // Caso de prueba con todos los números impares
        XCTAssertEqual(sumOfEvenNumbers(in: [1, 3, 5, 7]), 0, "La suma de números pares debería ser 0")
    }

    func testSumOfEvenNumbersWithEmptyArray() {
        // Caso de prueba con un array vacío
        XCTAssertEqual(sumOfEvenNumbers(in: []), 0, "La suma de números pares debería ser 0")
    }

    func testSumOfEvenNumbersWithMixedNumbers() {
        // Caso de prueba con una mezcla de números pares e impares
        XCTAssertEqual(sumOfEvenNumbers(in: [1, 2, 3, 4, 5]), 6, "La suma de números pares debería ser 6")
    }
}

