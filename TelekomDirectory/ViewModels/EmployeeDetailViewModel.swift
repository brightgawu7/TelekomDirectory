//
//  EmployeeDetailViewModel.swift
//  TelekomDirectory
//
//  Created by AMALITECH-PC-105889 on 10/14/24.
//

import SwiftUI

@Observable
class EmployeeDetailViewModel {
    var isPresentTeamView: Bool = false
    var isLoadingTeamView: Bool = false
    var isPresentReportingTimeView: Bool = false
    var isLoadingReportingTimeView: Bool = false
    var employeeTeam: [Employee] = []
    var filteredEmployeeTeam: [Employee] = []

    var selectedEmployeeType: EmployeeType? = nil

    @ObservationIgnored var employeeDataManager: EmployeeDataManagerProtocol

    init(employeeDataManager: EmployeeDataManagerProtocol) {
        self.employeeDataManager = employeeDataManager
    }

    func fetchEmployeeTeam(teamId: UUID) async {
        isLoadingTeamView = true
        let employees = await employeeDataManager.getEmployeesByTeam(withId: teamId)
        await MainActor.run {
            self.employeeTeam = employees
            self.filteredEmployeeTeam = employees
            self.isLoadingTeamView = false
        }
    }
    
    func filterEmployeeTeam( withType type: EmployeeType?) {
        selectedEmployeeType = type
        
        guard let type else {
            filteredEmployeeTeam = employeeTeam
            return
        }
        
        filteredEmployeeTeam = employeeTeam.filter { $0.employeeType == type }
    }
}
