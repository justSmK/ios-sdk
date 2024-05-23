//
//  CircleProtocol.swift
//  TestAssignmentMindbox
//
//  Created by Sergei Semko on 2/8/24.
//

import Foundation

/// Протокол для круга
public protocol CircleProtocol: ShapeProtocol, FormattableAreaProtocol {
    /// Радиус круга
    var radius: Double { get }
    
    /// Инициализация круга с заданным радиусом
    /// - Parameter radius: Радиус круга. Должен быть больше 0
    /// - Throws: `CircleError.invalidRadius`, если радиус меньше 0
    init(radius: Double) throws
    
    /// Изменение радиуса круга
    /// - Parameter value: Новое значение радиуса
    mutating func changeRadius(new value: Double)
}
