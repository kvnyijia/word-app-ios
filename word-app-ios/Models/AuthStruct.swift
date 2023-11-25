import Foundation

struct Credentials {
    var accessToken: String?
    // var refreshToken: String?
}

enum KeychainKey: String {
    case accessToken
    case refreshToken
}
