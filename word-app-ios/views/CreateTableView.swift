import SwiftUI

struct CreateTableView: View {
    
    @Binding
    var showModal: Bool
    @State
    var isSuccess: Bool?
    @State
    var name: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Create table!!")
            TextField("enter name for new table", text: $name)
                .textFieldStyle(WhiteBorder())
            Button {
                TableApi().createTable(name: name) { (res) in
                    isSuccess = res
                }
                //self.showModal.toggle()
                dismiss()
            } label: {
                Text("Create").frame(maxWidth: .infinity)
            }
            .buttonStyle(ActionButton())
        }.frame(maxWidth: 300)
    }
}

// Structure creating a custom textFieldStyle
struct WhiteBorder: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(lineWidth: 1)
            )
    }
}

//struct CreateTableView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateTableView(showModal: true)
//    }
//}
