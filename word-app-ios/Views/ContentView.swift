import SwiftUI

struct ContentView: View {
    var body: some View {
        SubContentView()
            .environmentObject(Auth.shared)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
