//
//  TableModel.swift
//  VK intern task swiftui
//
//  Created by Данила Семисчастнов on 27.03.2022.
//

import Foundation
import Combine

class TableModel: ObservableObject {
    static let shared: TableModel = TableModel()
    
    func fetchData(perPage: Int = 30, sinceId: Int? = nil) -> AnyPublisher<[Cell], Error> {
        var components = URLComponents(string: "https://95c8606c-95e9-4307-9610-4b5b618782da.mock.pstmn.io/getCells")!
        components.queryItems = [
            URLQueryItem(name: "per_page", value: "\(perPage)"),
            URLQueryItem(name: "since", value: (sinceId != nil) ? String(sinceId!) : nil)
        ]
        let request = URLRequest(url: components.url!, timeoutInterval: 10)
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: [Cell].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

struct Cell: Decodable {
    let id: Int
    let date: String
    var value: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case date = "date"
        case value = "value"
    }
}

enum FetchState: String {
    case success = "All done"
    case errorOccured = "Couldn't fetch data"
}
