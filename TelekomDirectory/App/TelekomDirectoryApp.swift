//
//  TelekomDirectoryApp.swift
//  TelekomDirectory
//
//  Created by AMALITECH-PC-105889 on 10/13/24.
//

import SwiftUI

@main
struct TelekomDirectoryApp: App {
    @State private var employeeDataManager: EmployeeDataManagerProtocol = EmployeeDataManager()
    @State private var appNavigationPathViewModel: AppNavigationPathViewModel =  AppNavigationPathViewModel()

    
    var body: some Scene {
        WindowGroup {
            EmployeeSearchScreen(employeeDataManager: employeeDataManager, appNavigationPathViewModel: appNavigationPathViewModel)
                .environment(appNavigationPathViewModel)
                        .environment(\.employeeDataManager, employeeDataManager)
        }
    }
}
