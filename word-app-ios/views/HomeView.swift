import SwiftUI

struct HomeView: View {
    
    @State
    var get_tables_res: GetTables?
    @State
    private var show_createTable_modal = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Home")
                        .font(.title)
                        .fontWeight(.black)
                    HStack(spacing: 120) {
                        Text("Your table")
                        Button("Create Table") {
                            show_createTable_modal.toggle()
                        }
                        .fullScreenCover(isPresented: $show_createTable_modal, onDismiss: {
                            sleep(1)
                            reload_view()
                        }, content: {
                            CreateTableView(showModal: self.$show_createTable_modal)
                        })
                    }
                    VStack(alignment: .leading, spacing: 5) {
                        if let tables = get_tables_res?.tables as? [Table] {
                            ForEach(tables, id: \.id) { t in
                                NavigationLink(destination: TableView(table_name: t.name, table_id: t.id)) {
                                    Text(t.name).frame(maxWidth: .infinity)
                                }
                                .buttonStyle(ItemButton())
                            }
                        }
                    }
                    .onAppear() {
                        reload_view()
                    }
                }
            }
            .frame(maxWidth: 300)
        }
    }
    
    func reload_view() {
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
