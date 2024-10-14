//
//  ContactsListView.swift
//  TelekomDirectory
//
//  Created by AMALITECH-PC-105889 on 10/14/24.
//

import SwiftUI

struct ContactsListView: View {
    @Environment(EmployeeSearchViewModel.self) private var employeeSearchViewModel
    var body: some View {
        VStack(alignment: .leading) {
            SearchContentLabel(title: "Contacts")
            
            ScrollView {
                LazyVGrid(columns: [.init(.flexible())]) {
                    ForEach(employeeSearchViewModel.filteredEmployees){ employee in
                        NavigationLink(value: employee) {
                            EmployeeCard(employee: employee, searchText: employeeSearchViewModel.searchText)
                
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    BackgroundViewWrapper{
        ContactsListView()
            .padding()
            .environment(EmployeeSearchViewModel(employeeDataManager: EmployeeDataManager()))
    }
}
