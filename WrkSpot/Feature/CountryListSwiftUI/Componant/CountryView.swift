//
//  CountryView.swift
//  WrkSpot
//
//  Created by Ravi Ranjan on 19/02/24.
//

import Foundation
import SwiftUI
struct CountryView: View {
    var countryDetail: CountryDetailModel
    
    var body: some View {
        HStack {
            Text(countryDetail.name ?? "")
                .padding(.leading)
                .foregroundColor(.white)
                .bold()
            Spacer()
            VStack {
                HStack {
                    Spacer()
                    Text("Capital : ")
                        .multilineTextAlignment(.leading)
                        .bold()
                    Text(countryDetail.capital ?? "")
                        .multilineTextAlignment(.trailing)
                }
                .padding(.top)
                .padding(.trailing)
                HStack {
                    Spacer()
                    Text("Currency : ")
                        .multilineTextAlignment(.leading)
                        .bold()
                    Text(countryDetail.currency ?? "")
                        .multilineTextAlignment(.trailing)
                }
                .padding(.trailing)
                HStack {
                    Spacer()
                    Text("Population : ")
                        .multilineTextAlignment(.leading)
                        .bold()
                    Text("\(countryDetail.population ?? 0)")
                        .multilineTextAlignment(.trailing)
                }
                .padding(.trailing)
                .padding(.bottom)
            }
            .foregroundColor(.white)
        }
        .background(Color.mint)
        .cornerRadius(10.0)
    }
}
