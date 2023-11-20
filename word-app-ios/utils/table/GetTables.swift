import Foundation

struct Table: Codable, Identifiable, Equatable {
    let id: Int
    let owner: String
    let name: String
}

struct GetTables: Codable, Equatable {
    let owner: String
    let tables: [Table]
}
