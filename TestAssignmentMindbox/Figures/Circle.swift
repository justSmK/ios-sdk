//
//  Circle.swift
//  TestAssignmentMindbox
//
//  Created by Sergei Semko on 2/8/24.
//

import Foundation
import OSLog

/// Круг
public struct Circle: CircleProtocol {
    /// Радиус круга. При попытке установить отрицательное значение, радиус будет установлен в 0.
    public private(set) var radius: Double {
        didSet {
            if radius < 0 {
                Logger.circle.warning(
                    "The radius of the circle is less than zero: \(oldValue). The default value is 0."
                )
                radius = 0
            }
        }
    }
    
    /// Создание экземпляра `Circle` с заданным радиусом
    /// - Parameter radius: Радиус круга. Должен быть больше 0.
    /// - Throws: `CircleError.invalidRadius`, если радиус меньше 0`
    public init(radius: Double) throws {
        guard !radius.isLess(than: 0) else {
            Logger.circle.error("Failed to create Circle instance: negative radius value.")
            throw CircleError.invalidRadius(radius)
        }
        self.radius = radius
    }
    
    /// Изменение радиуса круга
    /// - Parameter value: Новое значение радиуса
    public mutating func changeRadius(new value: Double) {
        radius = value
    }
    
    /// Площадь круга
    public var area: Double {
        Double.pi * radius * radius
    }
}

// MARK: - Public Circle Error

/// Ошибки при работе с Кругом
public enum CircleError: Error {
    case invalidRadius(Double)
}

// MARK: - FormattableAreaProtocol

extension Circle: FormattableAreaProtocol {}
