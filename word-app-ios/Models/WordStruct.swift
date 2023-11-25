import Foundation

struct Word: Codable, Identifiable, Equatable {
    let id: Int
    let table_id: Int
    let term: String
    let meaning: String
    let picture_url: String
}

struct GetWords: Codable, Equatable {
    let table_id: Int
    let words: [Word]
}
