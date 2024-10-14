import SwiftUI

struct TeamView: View {
    @State var viewModel: EmployeeDetailViewModel
    @Environment(AppNavigationPathViewModel.self) var navigationPathViewModel
    
    var body: some View {
        NavigationStack {
            BackgroundViewWrapper {
                ScrollView {
                    VStack(spacing: 30) {
                        FilterButtonsView(viewModel: viewModel)
                        
                        if viewModel.filteredEmployeeTeam.isEmpty {
                            PlaceholderTextView(placeholderText: "No employees found")
                        } else {
                            EmployeeGrid(viewModel: viewModel, navigationPathViewModel: navigationPathViewModel)
                        }
                    }
                }
                .padding()
                .navigationTitle("People@Telekom")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar { navigationToolbar }
            }
        }
    }
    
    private var navigationToolbar: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button(action: {
                viewModel.isPresentTeamView = false
            }) {
                Image(systemName: "arrow.backward")
                    .foregroundColor(.defaultText)
            }
        }
    }
}

struct FilterButtonsView: View {
    var viewModel: EmployeeDetailViewModel

    var body: some View {
        HStack(spacing: 10) {
            FilterButton(title: "All", isSelected: viewModel.selectedEmployeeType == nil) {
                viewModel.filterEmployeeTeam(withType: nil)
            }
            
            ForEach(EmployeeType.allCases, id: \.self) { type in
                FilterButton(title: type.rawValue.capitalized, isSelected: viewModel.selectedEmployeeType == type) {
                    viewModel.filterEmployeeTeam(withType: type)
                }
            }
        }
        .padding(2)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct FilterButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .padding(.vertical, 5)
                .padding(.horizontal, 15)
                .font(.callout)
                .foregroundStyle(.defaultText)
                .background(isSelected ? .purpleRed : .darkGrayBackground)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.defaultText, lineWidth: isSelected ? 0 : 1)
                )
        }
    }
}

struct EmployeeGrid: View {
    var viewModel: EmployeeDetailViewModel
  var navigationPathViewModel: AppNavigationPathViewModel

    var body: some View {
        LazyVGrid(columns: [.init(.flexible())]) {
            ForEach(viewModel.filteredEmployeeTeam) { employee in
                Button {
                    withAnimation(.linear.speed(0.5)) {
                        viewModel.isPresentTeamView = false
                        navigationPathViewModel.path.removeLast()
                        navigationPathViewModel.path.append(employee)
                    }
                } label: {
                    EmployeeCard(employee: employee, searchText: "")
                }
            }
        }
    }
}

#Preview {
    TeamView(viewModel: EmployeeDetailViewModel(employeeDataManager: EmployeeDataManager()))
        .environment(AppNavigationPathViewModel())
}
