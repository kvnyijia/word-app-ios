
import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem{ Label("Home", systemImage: "star") }
            MeView()
                .tabItem{ Label("Me", systemImage: "person.crop.circle.fill") }
        }
    }
}

#Preview {
    AppView()
}
