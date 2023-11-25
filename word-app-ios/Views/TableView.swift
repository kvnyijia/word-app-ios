import SwiftUI

struct TableView: View {
    
    var table_name: String
    var table_id: Int
    @State
    var get_words_res: GetWords?
    @State
    var show_createWord_modal = false
    
    var body: some View {
        VStack {
            Text(table_name)
                .font(.title)
                .fontWeight(.black)
            Button("Add Word") {
                show_createWord_modal.toggle()
            }
            .fullScreenCover(isPresented: $show_createWord_modal, onDismiss: {
                sleep(1)
                reload_view()
            }, content: {
                CreateWordView(table_id: table_id)
            })
            if let words = get_words_res?.words as? [Word] {
                ForEach(words) { w in
                    Button {
                        
                    } label: {
                        Text(w.term)
                    }
                    .buttonStyle(ItemButton())
                }
            }
        }
        .onAppear() {
            reload_view()
        }
    }
    
    func reload_view() {
        WordApi().getWords(table_id: table_id) { res in
            get_words_res = res
        }
    }
}

struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        TableView(table_name: "table_name", table_id: 0)
    }
}
