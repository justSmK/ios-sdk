//
//  TriangleTests.swift
//  TestAssignmentMindboxTests
//
//  Created by Sergei Semko on 2/8/24.
//

import XCTest
@testable import TestAssignmentMindbox

final class TriangleTests: XCTestCase {

    var triangle: TriangleProtocol!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        triangle = try Triangle(sideA: 10, sideB: 10, sideC: 10)
    }
    
    override func tearDownWithError() throws {
        triangle = nil
        try super.tearDownWithError()
    }

    func testTriangleArea() {
        let expectations = 43.30127018922193
        let area = triangle.area
        XCTAssertEqual(area, expectations, "Некорректно считается площадь")
        XCTAssertFalse(triangle.isRightAngled, "Треугольник не является прямоугольным")
    }
    
    func testTriangleFormattedAreaString() {
        let expectation = "43.3"
        let area = triangle.formattedAreaString
        XCTAssertEqual(area, expectation, "Некорректное форматирование в строку")
    }
    
    func testTriangleFormattedAreaDouble() {
        let expectation = 43.30
        let area = triangle.formattedAreaDouble
        XCTAssertEqual(area, expectation, "Некорректное форматирование в число с плавающей точкой")
    }
    
    func testNonExistenceTriangle() {
        XCTAssertThrowsError(try Triangle(sideA: 1, sideB: 1, sideC: 10)) { error in
            guard let triangleError = error as? TriangleError else {
                return XCTFail("Ожидалась ошибка TriangleError")
            }
            
            switch triangleError {
            case .invalidTriangle(let sideA, let sideB, let sideC):
                XCTAssertEqual(sideA, 1, "Неверное значение для sideA")
                XCTAssertEqual(sideB, 1, "Неверное значение для sideB")
                XCTAssertEqual(sideC, 10, "Неверное значение для sideC")
            }
        }
    }
    
    func testRightAngledTriangle() {
        do {
            triangle = try Triangle(sideA: 3, sideB: 4, sideC: 5)
            let rightAngled = triangle.isRightAngled
            XCTAssertTrue(rightAngled, "Треугольник должен быть прямоугольным")
        } catch {
            XCTFail("Инициализация Triangle не должна была вызвать ошибку")
        }
    }
}
