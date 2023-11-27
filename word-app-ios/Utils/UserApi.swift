import Foundation

class UserApi {
    
    func loginUser(
        username: String,
        password: String,
        completion: @escaping (LoginUser) -> (),
        failure: @escaping (ErrRes) -> ()
    ) {
        let json: [String: Any] = ["username": username, "password": password]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        var req = URLRequest(url: URL(string: "\(Config().api_url)/users/login")!)
        req.httpMethod = "POST"
        req.httpBody = jsonData
        let task = URLSession.shared.dataTask(with: req) { data, res, err in
            if let data = data {
                let res = try? JSONDecoder().decode(LoginUser.self, from: data)
                
                if let res = res {
                    DispatchQueue.main.async {
                        completion(res)
                    }
                } else {
                    let res2 = try? JSONDecoder().decode(ErrRes.self, from: data)
                    if let res2 = res2 {
                        DispatchQueue.main.async {
                            failure(res2)
                        }
                    } else {
                        DispatchQueue.main.async {
                            failure(ErrRes(status: -2, message: Const().err_unknown, timestamp: -1))
                        }
                    }
                }
            } else {
                DispatchQueue.main.async {
                    failure(ErrRes(status: -1, message: "No data", timestamp: -1))
                }
            }
        }
        task.resume()
    }
}
