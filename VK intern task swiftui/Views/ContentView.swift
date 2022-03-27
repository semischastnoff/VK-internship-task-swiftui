//
//  ContentView.swift
//  VK intern task swiftui
//
//  Created by Данила Семисчастнов on 27.03.2022.
//

import SwiftUI
import Combine

struct ContentView: View {
    @StateObject var tableViewModel: TableViewModel = TableViewModel.shared
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.tableViewModel.cells, id: \.id) { cell in
                    CellView(cellInformation: cell)
                }
                    .listRowSeparator(.hidden)
                LoadingView(didFail: self.tableViewModel.didFail)
                    .onAppear(perform: self.fetchData)
                    .onTapGesture(perform: self.loadOnTap)
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("Показания датчика")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
    
    private func fetchData() {
        self.tableViewModel.getCells()
    }
    
    private func loadOnTap() {
        if self.tableViewModel.didFail {
            self.tableViewModel.didFail = false
            self.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
