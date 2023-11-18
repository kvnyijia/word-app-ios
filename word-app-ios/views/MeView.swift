import SwiftUI

struct MeView: View {
    
    @State var login_user: LoginUser?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Me")
                .font(.title)
                .fontWeight(.black)
            Text(login_user?.user.username ?? "not login")
        }.onAppear() {
            UserApi().loginUser { (login_user) in
                self.login_user = login_user
            }
        }
    }
}

struct MeView_Previews: PreviewProvider {
    static var previews: some View {
        MeView()
    }
}
