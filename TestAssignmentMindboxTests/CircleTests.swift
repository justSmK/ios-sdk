//
//  CircleTests.swift
//  TestAssignmentMindboxTests
//
//  Created by Sergei Semko on 2/8/24.
//

import XCTest
@testable import TestAssignmentMindbox

final class CircleTests: XCTestCase {

    var circle: CircleProtocol!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        circle = try Circle(radius: 10)
    }
    
    override func tearDownWithError() throws {
        circle = nil
        try super.tearDownWithError()
    }
    
    func testCircleArea() {
        let expectation = 314.1592653589793
        let area = circle.area
        XCTAssertEqual(area, expectation, "Некорректно считается площадь")
    }
    
    func testCircleFormattedAreaString() {
        let expectation = "314.16"
        let area = circle.formattedAreaString
        XCTAssertEqual(area, expectation, "Некорректное форматирование в строку")
    }
    
    func testCircleFormattedAreaDouble() {
        let expectation = 314.16
        let area = circle.formattedAreaDouble
        XCTAssertEqual(area, expectation, "Некорректное форматирование в число с плавающей точкой")
    }
    
    func testZeroRadiusCircleArea() {
        do {
            circle = try Circle(radius: 0)
            let expectation: Double = 0
            let radius = circle.radius
            let area = circle.area
            XCTAssertEqual(radius, expectation, "Радиус не соотвествует ожидаемому")
            XCTAssertEqual(area, expectation, "Площадь не соотвествует ожидаемому")
        } catch {
            XCTFail("Инициализация Circle не должна была вызвать ошибку")
        }
    }
    
    func testNegativeRadiusCircleArea() {
        XCTAssertThrowsError(try Circle(radius: -10)) { error in
            guard let circleError = error as? CircleError else {
                return XCTFail("Ожидалась ошибка CircleError")
            }
            
            if case .invalidRadius(let radius) = circleError {
                XCTAssertEqual(radius, -10, "Некорректное значение радиуса в ошибке")
            }
        }
    }

    func testCircleChangeRadiusPositive() {
        let expectation: Double = 2
        circle.changeRadius(new: 2)
        let radius = circle.radius
        XCTAssertEqual(radius, expectation, "Некорректно изменяется радиус")
    }
    
    func testCircleChangeRadiusNegative() {
        let expectation: Double = 0
        circle.changeRadius(new: -2)
        let radius = circle.radius
        XCTAssertEqual(radius, expectation, "Некорректно изменяется радиус при установке отрицательного значения")
    }
}
