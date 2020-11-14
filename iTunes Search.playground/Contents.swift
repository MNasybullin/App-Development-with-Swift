import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

struct StoreItem: Codable {
    var type: String
    var kind: String
    var artist: String
    var name: String
    var artworkURL: URL
    
    enum CodingKeys: String, CodingKey {
        case type = "wrapperType"
        case kind
        case artist = "artistName"
        case name = "trackName"
        case artworkURL = "trackViewUrl"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try values.decode(String.self, forKey: CodingKeys.type)
        self.kind = try values.decode(String.self, forKey: CodingKeys.kind)
        self.artist = try values.decode(String.self, forKey: CodingKeys.artist)
        self.name = try values.decode(String.self, forKey: CodingKeys.name)
        self.artworkURL = try values.decode(URL.self, forKey: CodingKeys.artworkURL)
    }
}

struct StoreItems: Codable {
    let results: [StoreItem]
}

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map {
            URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}

func fetchItems(completion: @escaping (StoreItems?) -> Void) {
    let baseURL = URL(string: "https://itunes.apple.com/search?")!
    let query: [String: String] = [
        "term": "Ария"
    ]

    let url = baseURL.withQueries(query)!
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        let jsonDecoder = JSONDecoder()
        if let data = data,
            let storeItems = try? jsonDecoder.decode(StoreItems.self, from: data) {
            completion(storeItems)
        } else {
            print("Either no data was returned, or data was not properly decoded.")
            completion(nil)
        }
    }

    task.resume()
}

fetchItems{ (fetchedInfo) in
    print(fetchedInfo)
}

