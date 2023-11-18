import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem{ Label("Home", systemImage: "star") }
            MeView()
                .tabItem{ Label("Me", systemImage: "person.crop.circle.fill") }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
