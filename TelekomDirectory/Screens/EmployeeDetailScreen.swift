//
//  EmployeeDetailScreen.swift
//  TelekomDirectory
//
//  Created by AMALITECH-PC-105889 on 10/13/24.
//

import SwiftUI

struct EmployeeDetailScreen: View {

    
    @Environment(AppNavigationPathViewModel.self) private var navigationPathViewModel
    @Environment(\.employeeDataManager) private var employeeDataManager
    var employee: Employee
    @State private var viewModel:EmployeeDetailViewModel

    init(employee:Employee,  employeeDataManager: EmployeeDataManagerProtocol ) {
        self.employee = employee
        self.viewModel = .init(employeeDataManager:  employeeDataManager)
    }
    
    
    

    
    var body: some View {
        BackgroundViewWrapper {
            ScrollView{
                VStack(spacing: 20) {
                    PhotoAvatar(imageURL: URL(string: employee.image ?? ""), size: 150)
                        .padding(.top, 40)
                    
                    Text(employee.name)
                        .foregroundStyle(.defaultText)
                        .font(.title2.weight(.semibold))
                    Group {
                        VStack {
                            Text(employee.address.office)
                            Text(employee.team.name)
                        }
                        
                        VStack {
                            Text(employee.address.city)
                            Text(employee.address.street)
                            Text(employee.address.country)
                        }
                    }
                    .font(.title3)
                    .foregroundStyle(.textDarkLight)
                    
                    VStack {
                        if let phone = employee.phone, !phone.isEmpty {
                            Text("Mobile \(phone)")
                        }
                        
                        if let email = employee.email, !email.isEmpty {
                            Text(email)
                        }
                    }
                    .font(.title2)
                    .foregroundStyle(.defaultText)
                    
                    HStack(spacing: 4) {
                        PhoneActionButton(phoneNumber: employee.phone)
                        EmailActionButton(emailAddress: employee.email)
                        AddContactActionButton(employee: employee)
                    }
                    
                    VStack(spacing: 20) {
                        HStack(spacing: 10) {
                            VStack(alignment: .leading) {
                                Text(employee.team.name)
                                Rectangle()
                                    .frame(height: 1)
                            }
                            Spacer()
                            
                            Button {
                                Task{
                                    
                                    await    viewModel.fetchEmployeeTeam(teamId: employee.team.id)
                                    
                                    await MainActor.run{
                                        viewModel.isPresentTeamView = true
                                    }
                                }
                            } label: {
                                
                                if viewModel.isLoadingTeamView {
                                    LoadingSpinner()
                                }else{
                    
                                    Image(systemName: "chevron.right")
                                        .font(.title3)
                                        .opacity(0.5)
                                }
                            }
                        }
                        
                        HStack {
                            Text("Reporting line")
                            
                            Spacer()
                            
                            Button {
                            } label: {
                                Image(systemName: "chevron.right")
                                    .font(.title3)
                                    .opacity(0.5)
                            }
                        }
                    }
                    .foregroundStyle(.defaultText)
                    .font(.title3)
                    .padding()
                    .padding(.vertical, 20)
                    .background(.grayDarkLight)
                    .cornerRadius(20)
                    
                    Spacer()
                }
                .padding(.horizontal)
                .navigationTitle("People@Telekom")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden()
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            navigationPathViewModel.path.removeLast()
                        }) {
                            Image(systemName: "arrow.backward")
                                .foregroundColor(.defaultText)
                        }
                    }
                }
            }
            .sheet(isPresented: $viewModel.isPresentTeamView) {
                TeamView(viewModel: viewModel)
            }
        }
    }
}

#Preview {
    NavigationStack {
        BackgroundViewWrapper {
            EmployeeDetailScreen(employee: mockEmployee, employeeDataManager: EmployeeDataManager())
                .environment(AppNavigationPathViewModel())
          
        }
    }
}
