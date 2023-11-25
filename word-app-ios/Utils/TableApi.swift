import Foundation

class TableApi {
    
    func getTables(completion: @escaping (GetTables)->()) {
        guard let access_token = Auth.shared.getAccessToken() else {
            return
        }
        guard let username = Auth.shared.getUsername() else {
            return
        }
        var req = URLRequest(url: URL(string: "\(Config().api_url)/tables?owner=\(username)")!)
        req.httpMethod = "GET"
        req.addValue("application/json", forHTTPHeaderField: "Content-Type")
        req.addValue("application/json", forHTTPHeaderField: "Accept")
        req.setValue("Bearer \(access_token)", forHTTPHeaderField: "Authorization")
        let task = URLSession.shared.dataTask(with: req) { data, res, err in
            guard let data = data, err == nil else {
                print(err?.localizedDescription ?? ">>> No data")
                return
            }
            let resJson = try! JSONDecoder().decode(GetTables.self, from: data)
            DispatchQueue.main.async {
                completion(resJson)
            }
        }
        task.resume()
    }
    
    func createTable(name: String, completion: @escaping (Bool)->()) {
        guard let access_token = Auth.shared.getAccessToken() else {
            return
        }
        guard let username = Auth.shared.getUsername() else {
            return
        }
        let json: [String: Any] = ["name": name, "owner": username]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        var req = URLRequest(url: URL(string: "\(Config().api_url)/tables")!)
        req.httpMethod = "POST"
        req.httpBody = jsonData
        req.addValue("application/json", forHTTPHeaderField: "Content-Type")
        req.addValue("application/json", forHTTPHeaderField: "Accept")
        req.setValue("Bearer \(access_token)", forHTTPHeaderField: "Authorization")
        let task = URLSession.shared.dataTask(with: req) { data, res, err in
            guard let data = data, err == nil else {
                print(err?.localizedDescription ?? "No data")
                return
            }
            let resJson = try! JSONDecoder().decode(Bool.self, from: data)
            DispatchQueue.main.async {
                completion(resJson)
            }
        }
        task.resume()
    }
}
