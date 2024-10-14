import SwiftUI

@Observable
class RecentSearchesViewModel {
    @ObservationIgnored @AppStorage("RecentSearches") private var recentSearchesStorage: Data = .init()

    var recentSearches: [RecentSearchItem] = []

    init() {
        loadRecentSearches()
    }

    func loadRecentSearches() {
        if let decodedList = try? JSONDecoder().decode([RecentSearchItem].self, from: recentSearchesStorage) {
            recentSearches = decodedList
        }
    }

    func addRecentSearch(id: UUID, name: String) {
        let newSearchItem = RecentSearchItem(id: id, name: name)

        recentSearches.removeAll(where: { $0.id == id })

        recentSearches.insert(newSearchItem, at: 0)

        if recentSearches.count > 5 {
            recentSearches = Array(recentSearches.prefix(5))
        }

        saveRecentSearches()
    }

    func removeRecentSearch(id: UUID) {
        recentSearches.removeAll(where: { $0.id == id })
        saveRecentSearches()
    }


    private func saveRecentSearches() {
        if let encodedList = try? JSONEncoder().encode(recentSearches) {
            recentSearchesStorage = encodedList
        }
    }
}
