import Foundation

class MeViewModel: ObservableObject {
    
    func logout() {
        Auth.shared.logout()
    }
}
