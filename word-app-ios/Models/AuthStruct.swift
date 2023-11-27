import Foundation

struct Credentials {
    var username: String?
    var accessToken: String?
    // var refreshToken: String?
}

enum KeychainKey: String {
    case username
    case accessToken
    case refreshToken
}
