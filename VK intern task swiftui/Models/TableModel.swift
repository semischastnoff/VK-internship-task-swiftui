//
//  TableModel.swift
//  VK intern task swiftui
//
//  Created by Данила Семисчастнов on 27.03.2022.
//

import Foundation

class TableModel: ObservableObject {
    static let shared: TableModel = TableModel()
    
    var cells: [Cell]
    
    func fetchData() {
        let url = URL(string: "https://95c8606c-95e9-4307-9610-4b5b618782da.mock.pstmn.io/getCells")!
        let request = URLRequest(url: url, timeoutInterval: 10)
        URLSession.shared.dataTask(with: request) { data, _, _ in
            if let fetchedData = data {

                let decoder = JSONDecoder()
                do {
                    let decodedData = try decoder.decode([Cell].self, from: fetchedData)
                    self.cells = decodedData
                } catch {
                    print("failure")
                }
            }
        }
        .resume()
    }
    
    init() {
        self.cells = []
        self.fetchData()
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
