

import SwiftUI

struct RecentSearchesView: View {
    @Environment(RecentSearchesViewModel.self) private var viewModel: RecentSearchesViewModel
    @Environment(EmployeeSearchViewModel.self) private var employeeSearchViewModel
    @Environment(AppNavigationPathViewModel.self) private var appNavigationPathViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            SearchContentLabel(title: "Recent searches")

            ScrollView {
                LazyVGrid(columns: [.init(.flexible())], spacing: 20) {
                    ForEach(viewModel.recentSearches) { recentSearch in

                        Button {
                            print("love")
                            Task {
                                let employee = await employeeSearchViewModel.fetchEmployee(withId: recentSearch.id)
                                await MainActor.run {
                                    appNavigationPathViewModel.path.append(employee)
                                }
                            }
                        } label: {
                            RecentSearchCard(searchItem: recentSearch) {
                                viewModel.removeRecentSearch(id: recentSearch.id)
                            }
                        }
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    BackgroundViewWrapper {
        RecentSearchesView()
            .environment(RecentSearchesViewModel())
            .padding()
    }
}
