//
//  FormattableAreaProtocol.swift
//  TestAssignmentMindbox
//
//  Created by Sergei Semko on 2/8/24.
//

import Foundation

/// Протокол для форматирования площади геометрической фигуры
public protocol FormattableAreaProtocol: ShapeProtocol {
    /// Возвращает строковое представление площади фигуры, форматированное с двумя знаками после запятой
    var formattedAreaString: String { get }
    
    /// Возвращает строковое представление площади фигуры, округленное до двух знаков после запятой
    var formattedAreaDouble: Double { get }
}

extension FormattableAreaProtocol {
    /// Реализация по-умолчанию для получения округленного значения площади фигуры
    public var formattedAreaDouble: Double {
        (area * 100).rounded() / 100
    }
    
    /// Реализация по-умолчанию для получения строки, представляющей площадь фигуры,
    /// форматированной с использованием локальных настроек и двух знаков после запятой
    public var formattedAreaString: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        
        let areaValue = NSNumber(value: self.area)
        return formatter.string(from: areaValue) ?? ""
    }
}
