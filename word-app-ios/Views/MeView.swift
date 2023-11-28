import SwiftUI

struct MeView: View {
    
    @ObservedObject
    var viewModel: MeViewModel = MeViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Me")
                    .font(.title)
                    .fontWeight(.black)
                
                VStack(alignment: .center, spacing: 20) {
                    Circle()
                        .stroke(.gray, lineWidth: 2)
                        .frame(width: 100)
                    
                    if let username = Auth.shared.getUsername() {
                        Text("@\(username)")
                    } else {
                        Text("not login")
                    }
                    
                    Button("Logout") {
                        viewModel.logout()
                    }
                    .buttonStyle(ActionButton())
                    
                    Spacer()
                }
            }
            .padding(30)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "gear")
                            .frame(maxWidth: 30, alignment:.bottomTrailing)
                            .foregroundColor(.gray)
                    }
                    
                }
            }
        } // NavigationView
    }
}

struct MeView_Previews: PreviewProvider {
    static var previews: some View {
        MeView()
    }
}
