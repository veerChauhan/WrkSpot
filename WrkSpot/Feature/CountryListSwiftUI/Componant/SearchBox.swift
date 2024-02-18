//
//  SearchBox.swift
//  WrkSpot
//
//  Created by Ravi Ranjan on 19/02/24.
//

import Foundation
import SwiftUI
struct SearchBox: View {
    @Binding var searchedText: String

    var body: some View {
        HStack {
            TextField("Search", text: $searchedText)
                .padding(10)
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(Color.white)
                .cornerRadius(10)

            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(10)
                .background(Color.white)
                .cornerRadius(10)
                .padding([.leading, .trailing], 5)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray.opacity(0.5), lineWidth: 2)
        )
        .padding([.leading, .trailing])
    }
}

struct SearchBox_Previews: PreviewProvider {
    static var previews: some View {
        SearchBox(searchedText: .constant(""))
    }
}
