import SwiftUI

struct SubContentView: View {
    
    @EnvironmentObject
    var auth: Auth
    
    var body: some View {
        if auth.loggedIn {
            AppView()
        } else {
            LoginUserView()
        }
    }
}

#Preview {
    SubContentView()
}
