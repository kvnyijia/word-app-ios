import SwiftUI

struct MeView: View {
    
    @ObservedObject
    var viewModel: MeViewModel = MeViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Me")
                .font(.title)
                .fontWeight(.black)
            Text(Auth.shared.getUsername() ?? "not login")
            Button("Logout") {
                viewModel.logout()
            }
            .buttonStyle(ActionButton())
        }
    }
}

struct MeView_Previews: PreviewProvider {
    static var previews: some View {
        MeView()
    }
}
