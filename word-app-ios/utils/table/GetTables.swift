import Foundation

struct Table: Codable, Identifiable {
    let id: Int
    let owner: String
    let name: String
}

struct GetTables: Codable {
    let owner: String
    let tables: [Table]
}
