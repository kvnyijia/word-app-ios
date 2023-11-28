import SwiftUI

struct LoginUserView: View {
    
    @ObservedObject 
    var viewModel: LoginUserViewModel = LoginUserViewModel()
        
    var body: some View {
        VStack {
            
            Spacer()
            
            Text("Welcome Back!")
                .font(.title)
                .fontWeight(.black)
            
            VStack {
                TextField(
                    //"Login.UsernameField.Title".localized,
                    "Username",
                    text: $viewModel.username
                )
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding(.bottom, 20)
                .textFieldStyle(WhiteBorder())
                
                SecureField(
                    //"Login.PasswordField.Title".localized,
                    "Password",
                    text: $viewModel.password
                )
                .textFieldStyle(WhiteBorder())
            }
            
            if viewModel.staus == 401 {
                Text(Const().err_invalid_up)
                    .foregroundColor(.red)
            } else if viewModel.staus == -1 {
                Text(Const().err_sever_nw)
                    .foregroundColor(.red)
            } else if viewModel.staus == -2 {
                Text(Const().err_unknown)
                    .foregroundColor(.red)
            }
            
            Spacer()
            
            Button(
                action: viewModel.login,
                label: {
                    //Text("Login.LoginButton.Title".localized)
                    Text("Login")
                        .font(.system(size: 24, weight: .bold, design: .default))
                        .frame(maxWidth: .infinity, maxHeight: 40)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .cornerRadius(30)
                }
            )
        }
        .padding(30)
    }
}

#Preview {
    LoginUserView()
}
