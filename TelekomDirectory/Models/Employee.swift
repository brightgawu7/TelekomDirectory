//
//  Employee.swift
//  TelekomDirectory
//
//  Created by AMALITECH-PC-105889 on 10/13/24.
//

import Foundation

struct Employee: Identifiable, Codable, Hashable{
    let id: UUID
    let name: String
    let position: String
    let employeeType: EmployeeType
    let address: Address
    let team: Team
    
    let email: String?
    let image: String?
    let phone: String?
}
