//
//  EmployeeSearchViewModel.swift
//  TelekomDirectory
//
//  Created by AMALITECH-PC-105889 on 10/14/24.
//

import SwiftUI

import Combine

@Observable
class EmployeeSearchViewModel {
    var searchText: String = "" {
        didSet {
            debouncedText.send(searchText)
        }
    }

    var isLoading: Bool = false
    var filteredEmployees: [Employee] = []

    @ObservationIgnored var employeeDataManager: EmployeeDataManagerProtocol
    @ObservationIgnored private var cancellables = Set<AnyCancellable>()
    @ObservationIgnored private var debouncedText = CurrentValueSubject<String, Never>("")

    init(employeeDataManager: EmployeeDataManagerProtocol) {
        self.employeeDataManager = employeeDataManager

        addSubscribers()
    }

    private func addSubscribers() {
        debouncedText
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .dropFirst()
            .sink { [weak self] searchText in
                self?.filterEmployee(searchText: searchText)
            }
            .store(in: &cancellables)
    }

    private func filterEmployee(searchText: String) {
        isLoading = true

        guard !searchText.isEmpty && searchText.count >= 2 else {
            filteredEmployees = []
            isLoading = false
            return
        }

        Task { @MainActor in
            self.filteredEmployees = await employeeDataManager.search(byName: searchText)
            isLoading = false
        }
    }

    func loadEmployees() async {
        try? await employeeDataManager.fetchData()
    }

    func fetchEmployee(withId id: UUID) async -> Employee {
        await employeeDataManager.fetchEmployee(by: id)
    }
}
