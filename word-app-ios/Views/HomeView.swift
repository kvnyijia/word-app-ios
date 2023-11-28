import SwiftUI

struct HomeView: View {
    
    @State
    var get_tables_res: GetTables?
    @State
    private var show_createTable_modal = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 5) {
                    if let tables = get_tables_res?.tables as? [Table] {
                        ForEach(tables, id: \.id) { t in
                            NavigationLink(destination: TableView(table_name: t.name, table_id: t.id)) {
                                Text(t.name).frame(maxWidth: .infinity)
                            }
                            .buttonStyle(ItemButton())
                        }
                    } else {
                        Spacer()
                    }
                }
                .padding()
                .onAppear() {
                    reload_view()
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Tables")
                        .font(.title2)
                        .fontWeight(.black)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        show_createTable_modal.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .frame(maxWidth: 30, alignment:.bottomTrailing)
                            .foregroundColor(.gray)
                    }
                    .fullScreenCover(isPresented: $show_createTable_modal, onDismiss: {
                        sleep(1)
                        reload_view()
                    }, content: {
                        CreateTableView(showModal: self.$show_createTable_modal)
                    })
                }
            }
        } // NavigationView
    }
    
    func reload_view() {
        //Auth.shared.logout()
        TableApi().getTables { (res) in
            self.get_tables_res = res
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
