import Foundation

class LoginUserViewModel: ObservableObject {
    
    @Published 
    var username: String = ""
    @Published 
    var password: String = ""

    func login() {
        UserApi().loginUser(username: username, password: password) { res in
            // Login successful, navigate to the Home screen
            Auth.shared.setCredentials(accessToken: res.access_token, refreshToken: "")
        }
    }
}
