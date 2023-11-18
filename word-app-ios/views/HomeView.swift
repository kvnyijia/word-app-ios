import SwiftUI

struct HomeView: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Home")
                .font(.title)
                .fontWeight(.black)
            HStack {
                Text("Your table")
                Button(action: handleClick) {
                    Label("Create Table", systemImage: "arrow.up")
                }
            }
        }
    }
    
    var cnt = 0
    func handleClick() {
        print("cnt = \(cnt)")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
