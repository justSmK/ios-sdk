//
//  ShapeTests.swift
//  TestAssignmentMindboxTests
//
//  Created by Sergei Semko on 2/8/24.
//

import XCTest
@testable import TestAssignmentMindbox

final class ShapeTests: XCTestCase {
    
    var shape: ShapeProtocol!
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        shape = nil
        super.tearDown()
    }

    func testCircleArea() {
        do {
            shape = try Circle(radius: 10)
            let expectationsArea = 314.1592653589793
            let area = shape.area
            XCTAssertEqual(area, expectationsArea, "Некорректно считается площадь круга")
        } catch {
            XCTFail("Инициализация Circle не должна была вызвать ошибку")
        }
    }

    func testTriangleArea() {
        do {
            shape = try Triangle(sideA: 10, sideB: 10, sideC: 10)
            let expectationsArea = 43.30127018922193
            let area = shape.area
            XCTAssertEqual(area, expectationsArea, "Некорректно считается площадь треугольника")
        } catch {
            XCTFail("Инициализация Triangle не должна была вызвать ошибку")
        }
    }
}
