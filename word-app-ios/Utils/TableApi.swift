import Foundation

class TableApi {
    
    func getTables(completion: @escaping (GetTables)->()) {
        var req = URLRequest(url: URL(string: "\(Config().api_url)/tables?owner=\(Config().username)")!)
        req.httpMethod = "GET"
        req.addValue("application/json", forHTTPHeaderField: "Content-Type")
        req.addValue("application/json", forHTTPHeaderField: "Accept")
        req.setValue("Bearer \(Config().token)", forHTTPHeaderField: "Authorization")
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
        let json: [String: Any] = ["name": name, "owner": Config().username]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        var req = URLRequest(url: URL(string: "\(Config().api_url)/tables")!)
        req.httpMethod = "POST"
        req.httpBody = jsonData
        req.addValue("application/json", forHTTPHeaderField: "Content-Type")
        req.addValue("application/json", forHTTPHeaderField: "Accept")
        req.setValue("Bearer \(Config().token)", forHTTPHeaderField: "Authorization")
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
