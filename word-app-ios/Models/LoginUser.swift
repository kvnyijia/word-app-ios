import Foundation

struct User: Codable {
    let username: String
    let email: String
}

struct LoginUser: Codable {
    let access_token: String
    let user: User
}
