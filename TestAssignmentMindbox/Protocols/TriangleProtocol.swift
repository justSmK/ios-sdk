//
//  TriangleProtocol.swift
//  TestAssignmentMindbox
//
//  Created by Sergei Semko on 2/8/24.
//

import Foundation

/// Протокол для треугольника
public protocol TriangleProtocol: ShapeProtocol, FormattableAreaProtocol {
    /// Сторона треугольника A
    var sideA: Double { get }
    /// Сторона треугольника B
    var sideB: Double { get }
    /// Сторона треугольника C
    var sideC: Double { get }
    
    /// Инициализация треугольника с заданными сторонами
    /// - Parameters:
    ///   - sideA: Сторона треугольника A
    ///   - sideB: Сторона треугольника B
    ///   - sideC: Сторона треугольника C
    /// - Throws: `TriangleError.invalidTriangle`, если треугольник с такими сторонами существовать не может
    init(sideA: Double, sideB: Double, sideC: Double) throws
    
    /// Проверка, является ли треугольник прямоугольным
    var isRightAngled: Bool { get }
}
