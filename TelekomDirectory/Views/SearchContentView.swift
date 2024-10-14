//
//  SearchContentView.swift
//  TelekomDirectory
//
//  Created by AMALITECH-PC-105889 on 10/14/24.
//

import SwiftUI

struct SearchContentView: View {
    @Environment(EmployeeSearchViewModel.self) private var employeeSearchViewModel

    @Environment(RecentSearchesViewModel.self) private var recentSearchesViewModel

    var body: some View {
        VStack(alignment: .leading) {
            if employeeSearchViewModel.isLoading {
                LoadingSpinner()
            } else if !recentSearchesViewModel.recentSearches.isEmpty && employeeSearchViewModel.searchText.isEmpty {
                RecentSearchesView()
            } else if employeeSearchViewModel.searchText.isEmpty || employeeSearchViewModel.searchText.count < 2 {
                PlaceholderTextView()
            } else if employeeSearchViewModel.filteredEmployees.isEmpty {
                PlaceholderTextView(placeholderText: "No employees found for \"\(employeeSearchViewModel.searchText)\".")
            } else {
                ContactsListView()
            }
        }
    }
}

#Preview {
    BackgroundViewWrapper {
        SearchContentView()
            .environment(EmployeeSearchViewModel(employeeDataManager: EmployeeDataManager()))
    }
}
