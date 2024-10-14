import Foundation

struct RecentSearchItem: Codable, Identifiable, Hashable {
    let id: UUID
    let name: String
}
