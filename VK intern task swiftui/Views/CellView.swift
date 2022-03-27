//
//  CellView.swift
//  VK intern task swiftui
//
//  Created by Данила Семисчастнов on 27.03.2022.
//

import SwiftUI

struct CellView: View {
    let cellInformation: Cell
    
    var body: some View {
        HStack {
            VStack {
                Text("Date")
                    .font(.caption)
                    .foregroundColor(.primary.opacity(0.5))
                Text(self.cellInformation.date)
                    .fontWeight(.semibold)
            }
            Spacer()
            VStack {
                Text("Value")
                    .font(.caption)
                    .foregroundColor(.primary.opacity(0.5))
                Text(self.cellInformation.value)
                    .fontWeight(.semibold)
            }
        }
        .padding()
        .padding(.horizontal)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20))
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(cellInformation: Cell(id: 1, date: "12.03.2022", value: "34"))
    }
}
