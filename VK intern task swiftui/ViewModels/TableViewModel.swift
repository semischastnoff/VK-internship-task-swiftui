//
//  TablePresenter.swift
//  VK intern task swiftui
//
//  Created by Данила Семисчастнов on 27.03.2022.
//

import Foundation
import Combine

class TableViewModel: ObservableObject {
    static let shared: TableViewModel = TableViewModel()
    
    var tableModel: TableModel = TableModel.shared
    
    @Published var cells: [Cell] = []
    @Published var didFail: Bool = false
    
    private let pageLimit = 10
    private var currentLastId: Int? = nil
    private var cancellable: AnyCancellable?
    
    func getCells() {
        self.cancellable = tableModel.fetchData(perPage: self.pageLimit, sinceId: self.currentLastId)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.didFail = true
                    print(error)
                case .finished:
                    print("success")
                }
            }, receiveValue: { cells in
                self.cells.append(contentsOf: cells)
                self.currentLastId = cells.last?.id
            })
    }
    
    let dateFormatter = DateFormatter()
    
    init() {
        self.dateFormatter.dateFormat = "d.MM.YY, HH:mm:ss"
    }
    
    func getFormattedDate(date: Date) -> String {
        return self.dateFormatter.string(from: date)
    }
}
