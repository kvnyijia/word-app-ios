import Foundation

class WordApi {
    
    func getWords(table_id: Int, completion: @escaping (GetWords)->()) {
        guard let access_token = Auth.shared.getAccessToken() else {
            return
        }
        var req = URLRequest(url: URL(string: "\(Config().api_url)/words?table_id=\(table_id)")!)
        req.httpMethod = "GET"
        req.addValue("application/json", forHTTPHeaderField: "Content-Type")
        req.addValue("application/json", forHTTPHeaderField: "Accept")
        req.setValue("Bearer \(access_token)", forHTTPHeaderField: "Authorization")
        let task = URLSession.shared.dataTask(with: req) { data, res, err in
            guard let data = data, err == nil else {
                print(err?.localizedDescription ?? ">>> No data")
                return
            }
            let resJson = try! JSONDecoder().decode(GetWords.self, from: data)
            DispatchQueue.main.async {
                completion(resJson)
            }
        }
        task.resume()
    }
    
    func createWord(table_id: Int, term: String, meaning: String, picture_url: String, completion: @escaping (Bool)->()) {
        guard let access_token = Auth.shared.getAccessToken() else {
            return
        }
        let json: [String: Any] = [
            "table_id": table_id,
            "term": term,
            "meaning": meaning,
            "picture_url": picture_url
        ]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        var req = URLRequest(url: URL(string: "\(Config().api_url)/words")!)
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
