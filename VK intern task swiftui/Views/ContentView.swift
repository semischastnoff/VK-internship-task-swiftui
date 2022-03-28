//
//  ContentView.swift
//  VK intern task swiftui
//
//  Created by Данила Семисчастнов on 27.03.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var tableViewModel: TableViewModel = TableViewModel.shared
    
    var body: some View {
        NavigationView {
            if self.tableViewModel.showList {
                List {
                    ForEach(self.tableViewModel.cells, id: \.id) { cell in
                        CellView(cellInformation: cell)
                    }
                        .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                .navigationTitle("Показания датчика")
                .navigationBarTitleDisplayMode(.automatic)
                .refreshable {
                    withAnimation(.easeOut) {
                        self.fetchData()
                    }
                }
            } else {
                Button {
                    withAnimation(.easeOut) {
                        self.tableViewModel.showList = true
                        self.fetchData()
                    }
                } label: {
                    Text("Загрузить")
                        .foregroundColor(.primary)
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding()
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20))
                }
                .navigationTitle("Показания датчика")
                .navigationBarTitleDisplayMode(.automatic)
            }
        }
    }
    
    private func fetchData() {
        self.tableViewModel.getCells()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
