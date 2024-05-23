//
//  Triangle.swift
//  TestAssignmentMindbox
//
//  Created by Sergei Semko on 2/8/24.
//

import Foundation
import OSLog

/// Треугольник
public struct Triangle: TriangleProtocol {
    /// Сторона треугольника A
    public private(set) var sideA: Double
    /// Сторона треугольника B
    public private(set) var sideB: Double
    /// Сторона треугольника C
    public private(set) var sideC: Double
    
    /// Создание экземпляра `Triangle` с заданными сторонами
    /// Проверка на то, может ли треугольник с такими сторонами существовать, согласно неравенству треугольника.
    /// (Сумма длин любых двух сторон должна быть больше длины третьей стороны).
    /// - Parameters:
    ///   - sideA: Сторона треугольника A
    ///   - sideB: Сторона треугольника B
    ///   - sideC: Сторона треугольника C
    public init(sideA: Double, sideB: Double, sideC: Double) throws {
        guard sideA + sideB > sideC, sideA + sideC > sideB, sideB + sideC > sideA else {
            Logger.triangle.error("Failed to create Triangle instance: The triangle cannot exist")
            throw TriangleError.invalidTriangle(sideA: sideA, sideB: sideB, sideC: sideC)
        }
        
        self.sideA = sideA
        self.sideB = sideB
        self.sideC = sideC
    }
    
    /// Площадь треугольника, вычисляемая при помощи формулы Герона
    public var area: Double {
        // Полупериметр треугольника
        let s = (sideA + sideB + sideC) / 2
        // Формула Герона
        return sqrt(s * (s - sideA) * (s - sideB) * (s - sideC))
    }
    
    /// Определение, является ли треугольник прямоугольным, используя теорему Пифагора.
    /// Считается что треугольник прямоугольный, если квадрат наибольшей стороны равен сумме квадратов двух других сторон,
    /// с учетом небольшой погрешности для обработки ошибок округления.
    public var isRightAngled: Bool {
        let sides = [sideA, sideB, sideC].sorted()
        // Проверка теоремы Пифагора с небольшой погрешностью для учета ошибок округления
        return abs(sides[2] * sides[2] - (sides[0] * sides[0] + sides[1] * sides[1])) < 0.000001
    }
}

// MARK: - Public Triangle Error

/// Ошибки при работе с треугольником
public enum TriangleError: Error {
    case invalidTriangle(sideA: Double, sideB: Double, sideC: Double)
}

// MARK: - FormattableAreaProtocol

extension Triangle: FormattableAreaProtocol {}
