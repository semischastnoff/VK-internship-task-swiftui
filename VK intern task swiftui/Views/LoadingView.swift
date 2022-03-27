//
//  LoadingView.swift
//  VK intern task swiftui
//
//  Created by Данила Семисчастнов on 27.03.2022.
//

import SwiftUI

struct LoadingView: View {
    var didFail: Bool
    
    var body: some View {
        Text(self.didFail ? "Failed. Tap to retry" : "Loading")
            .foregroundColor(self.didFail ? .red : .blue)
            .padding()
            .frame(maxWidth: .infinity, alignment: .center)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(didFail: false)
    }
}
