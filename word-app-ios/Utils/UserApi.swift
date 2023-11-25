import Foundation

class UserApi {
    
    func loginUser(completion: @escaping (LoginUser) -> ()) {
        let json: [String: Any] = ["username": Config().username, "password": Config().password]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        var req = URLRequest(url: URL(string: "\(Config().api_url)/users/login")!)
        req.httpMethod = "POST"
        req.httpBody = jsonData
        let task = URLSession.shared.dataTask(with: req) { data, res, err in
            guard let data = data, err == nil else {
                print(err?.localizedDescription ?? "No data")
                return
            }
            //let resJson = try? JSONSerialization.jsonObject(with: data, options: [])
            let resJson = try! JSONDecoder().decode(LoginUser.self, from: data)
            DispatchQueue.main.async {
                completion(resJson)
            }
        }
        task.resume()
    }
}
