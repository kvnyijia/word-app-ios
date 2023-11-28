import SwiftUI

struct CreateWordView: View {
    @State
    var term: String = ""
    @State
    var meaning: String = ""
    @State
    var picture_url: String = ""
    @Environment(\.dismiss)
    var dismiss
    var table_id: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Spacer()
            Text("Add a new word")
                .font(.title)
            TextField("enter a term", text: $term)
                .textFieldStyle(WhiteBorder())
            TextField("enter the term's meaning", text: $meaning)
                .textFieldStyle(WhiteBorder())
            TextField("enter a picture", text: $picture_url)
                .textFieldStyle(WhiteBorder())
            
            Spacer()
            
            Button {
                WordApi().createWord(table_id: table_id, term: term, meaning: meaning, picture_url: picture_url) { res in
                    
                }
                dismiss()
            } label: {
                Text("Create").frame(maxWidth: .infinity)
            }
            .buttonStyle(ActionButton())
            
            Button {
                dismiss()
            } label: {
                Text("Cancel").frame(maxWidth: .infinity)
            }
            .buttonStyle(ActionButton())
        }
        .frame(maxWidth: 300)
    }
}

struct CreateWordView_Previews: PreviewProvider {
    static var previews: some View {
        CreateWordView(table_id: 0)
    }
}
