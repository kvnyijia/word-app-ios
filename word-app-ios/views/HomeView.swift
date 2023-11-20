import SwiftUI

struct HomeView: View {
    
    @State
    var get_tables_res: GetTables?
    @State
    private var show_createTable_modal = false
    
    var body: some View {
        //NavigationView {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Home")
                    .font(.title)
                    .fontWeight(.black)
                HStack(spacing: 120) {
                    Text("Your table")
                    //NavigationLink(destination: CreateTableView()) {
                    //    Text("Create Table")
                    //}
                    //.buttonStyle(ActionButton())
                    Button("Create Table") {
                        show_createTable_modal.toggle()
                    }
                    .fullScreenCover(isPresented: $show_createTable_modal, onDismiss: {
                        // code to execute when sheet dismiss
                        print(">>> this is being called")
                        TableApi().getTables { (res) in
                            self.get_tables_res = res
                        }
                      }, content: {
                        CreateTableView(showModal: self.$show_createTable_modal)
                    })
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
                }
                .onChange(of: get_tables_res) { newValue in
                    //TableApi().getTables { (res) in
                    //    self.get_tables_res = res
                    //}
                    print(">>> value changed")
                }
                .onAppear() {
                    TableApi().getTables { (res) in
                        self.get_tables_res = res
                    }
                }
            }
            
        }
        .frame(maxWidth: 300)
        //}
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
