//
//  SumArrayViewTests.swift
//  TechnicalTestTests
//
//  Created by Lisette HG on 05/04/24.
//

import XCTest
@testable import TechnicalTest

class SumArrayViewTests: XCTestCase {

    func testSumOfEvenNumbersWithAllEvens() {
        // Test case with all even numbers
        XCTAssertEqual(sumOfEvenNumbers(in: [2, 4, 6, 8]), 20, "La suma de números pares debería ser 20")
    }

    func testSumOfEvenNumbersWithAllOdds() {
        // Test case with all odd numbers
        XCTAssertEqual(sumOfEvenNumbers(in: [1, 3, 5, 7]), 0, "La suma de números pares debería ser 0")
    }

    func testSumOfEvenNumbersWithEmptyArray() {
        // Test case with an empty array
        XCTAssertEqual(sumOfEvenNumbers(in: []), 0, "La suma de números pares debería ser 0")
    }

    func testSumOfEvenNumbersWithMixedNumbers() {
        // Test case with a mix of even and odd numbers
        XCTAssertEqual(sumOfEvenNumbers(in: [1, 2, 3, 4, 5]), 6, "La suma de números pares debería ser 6")
    }
}

