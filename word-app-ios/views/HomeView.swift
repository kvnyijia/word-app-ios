import SwiftUI

struct HomeView: View {
    
    @State
    var get_tables_res: GetTables?
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Home")
                    .font(.title)
                    .fontWeight(.black)
                HStack(spacing: 80) {
                    Text("Your table")
                    Button("Create Table") {
                        print("create...")
                    }
                    .buttonStyle(ActionButton())
                }
                VStack(alignment: .leading, spacing: 5) {
                    if let tables = get_tables_res?.tables as? [Table] {
                        ForEach(tables) { t in
                            Button {
                                print("hehehehe")
                            } label: {
                                Text(t.name).frame(maxWidth: .infinity)
                            }
                            .buttonStyle(ItemButton())
                        }
                    }
                }.onAppear() {
                    TableApi().getTables { (res) in
                        self.get_tables_res = res
                    }
                }
            }
        }
        .frame(maxWidth: 300)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
