//
//  EmployeeDataManager.swift
//  TelekomDirectory
//
//  Created by AMALITECH-PC-105889 on 10/14/24.
//

import Foundation

actor EmployeeDataManager: EmployeeDataManagerProtocol {
    private var cache: [Employee] = []

    func fetchData() async throws{
        if cache.isEmpty {
            cache = Bundle.main.decode("employees.json")
        }
    }

    func search(byName name: String) async -> [Employee] {
        guard !name.isEmpty else {
            return []
        }
        return cache.filter { $0.name.lowercased().contains(name.lowercased()) }
    }

    func fetchEmployee(by id: UUID) async -> Employee {
        return cache.first { $0.id == id } ?? mockEmployee
    }
    
    func getEmployeesByTeam(withId id: UUID) async -> [Employee]{
        return cache.filter { $0.team.id == id }
    }
}
