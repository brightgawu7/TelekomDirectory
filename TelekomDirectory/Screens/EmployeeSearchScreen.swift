//
//  EmployeeSearchScreen.swift
//  TelekomDirectory
//
//  Created by AMALITECH-PC-105889 on 10/13/24.
//

import SwiftUI

struct EmployeeSearchScreen: View {
    @State private var appNavigationPathViewModel: AppNavigationPathViewModel
    @State var employeeSearchViewModel: EmployeeSearchViewModel
    @State var recentSearchesViewModel: RecentSearchesViewModel = .init()
    @State private var employeeDetailViewModel: EmployeeDetailViewModel
    @State private var employeeManager: EmployeeDataManagerProtocol

    init(employeeDataManager: EmployeeDataManagerProtocol, appNavigationPathViewModel: AppNavigationPathViewModel) {
        employeeSearchViewModel = .init(employeeDataManager: employeeDataManager)
        self.appNavigationPathViewModel = appNavigationPathViewModel
        employeeDetailViewModel = .init(employeeDataManager: employeeDataManager)
        employeeManager = employeeDataManager
    }

    var body: some View {
        NavigationStack(path: $appNavigationPathViewModel.path ) {
            
            BackgroundViewWrapper{
            VStack {
                CustomSearchInput(text: $employeeSearchViewModel.searchText)
                SearchContentView()
                    .padding(.top, 30)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .padding(.horizontal)
            .navigationTitle("People@Telekom")
            .navigationBarTitleDisplayMode(.inline)
            .task {
                await employeeSearchViewModel.loadEmployees()
            }
            .environment(employeeSearchViewModel)
            .environment(recentSearchesViewModel)
            .environment(employeeDetailViewModel)
            .navigationDestination(for: Employee.self) { employee in
                EmployeeDetailScreen(employee: employee, employeeDataManager: employeeManager)
                    .onAppear {
                        recentSearchesViewModel.addRecentSearch(id: employee.id, name: employee.name)
                    }
            }}
        }
    }
}

#Preview {
    NavigationStack {
        BackgroundViewWrapper {
            EmployeeSearchScreen(employeeDataManager: EmployeeDataManager(), appNavigationPathViewModel: AppNavigationPathViewModel())
        }
    }
}
