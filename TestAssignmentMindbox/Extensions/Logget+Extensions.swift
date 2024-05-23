//
//  Logget+Extensions.swift
//  TestAssignmentMindbox
//
//  Created by Sergei Semko on 2/8/24.
//

import Foundation
import OSLog

extension Logger {
    /// Идентификатор подсистемы для логгирования, использующий идентификатор пакета приложения.
    /// Использование идентификатора пакета приложения гарантирует уникальность идентификатора подсистемы
    private static var subsystem = Bundle.main.bundleIdentifier!
    
    /// Логгер для круга
    static let circle = Logger(subsystem: subsystem, category: "circle")
    
    /// Логгер для треугольника
    static let triangle = Logger(subsystem: subsystem, category: "triangle")
}
