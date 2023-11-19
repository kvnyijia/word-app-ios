import SwiftUI

struct HomeView: View {
    
    @State var get_tables_res: GetTables?
    
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
            VStack {
                Text(get_tables_res?.owner ?? "cannot fetch")
                if let tables = get_tables_res?.tables as? [Table] {
                    ForEach(tables) { t in
                        Text(t.name)
                    }
                }
                
            }.onAppear() {
                TableApi().getTables { (res) in
                    self.get_tables_res = res
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
