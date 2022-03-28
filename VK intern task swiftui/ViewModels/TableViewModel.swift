//
//  TablePresenter.swift
//  VK intern task swiftui
//
//  Created by Данила Семисчастнов on 27.03.2022.
//

import Foundation

class TableViewModel: ObservableObject {
    static let shared: TableViewModel = TableViewModel()
    
    var tableModel: TableModel = TableModel.shared
    
    @Published var cells: [Cell] = []
    
    func getCells() {
        self.tableModel.fetchData()
        self.cells = self.tableModel.cells
    }
    
    @Published var showList: Bool = false
    
    let dateFormatter = DateFormatter()
    
    init() {
        self.dateFormatter.dateFormat = "d.MM.YY, HH:mm:ss"
        self.tableModel.fetchData()
        self.cells = self.tableModel.cells
    }
    
    func getFormattedDate(date: Date) -> String {
        return self.dateFormatter.string(from: date)
    }
}
