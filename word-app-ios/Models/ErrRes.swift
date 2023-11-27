import Foundation

struct ErrRes: Codable {
    let status: Int
    let message: String
    let timestamp: Int
}
