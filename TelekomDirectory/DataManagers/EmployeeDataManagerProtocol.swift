//
//  EmployeeDataManaging.swift
//  TelekomDirectory
//
//  Created by AMALITECH-PC-105889 on 10/14/24.
//

import Foundation
import SwiftUICore

protocol EmployeeDataManagerProtocol {
    func fetchData() async throws

    func search(byName name: String) async -> [Employee]

    func fetchEmployee(by id: UUID) async -> Employee
    
    func getEmployeesByTeam(withId id: UUID) async -> [Employee]
}



struct EmployeeDataManagerProtocolKey: EnvironmentKey {
    static var defaultValue: EmployeeDataManagerProtocol? = nil
}


extension EnvironmentValues {
    var employeeDataManager: EmployeeDataManagerProtocol? {
        get { self[EmployeeDataManagerProtocolKey.self] }
        set { self[EmployeeDataManagerProtocolKey.self] = newValue }
    }
}
