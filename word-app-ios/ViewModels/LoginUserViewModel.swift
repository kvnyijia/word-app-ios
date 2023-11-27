import Foundation

class LoginUserViewModel: ObservableObject {
    
    @Published 
    var username: String = ""
    @Published 
    var password: String = ""
    @Published
    var staus: Int = 200

    func login() {
        UserApi().loginUser(username: username, password: password) { res in
            // Login successful, navigate to the Home screen
            Auth.shared.setCredentials(username: res.user.username, accessToken: res.access_token, refreshToken: "")
        } failure: { err_res in
            self.staus = err_res.status
        }
    }
}
