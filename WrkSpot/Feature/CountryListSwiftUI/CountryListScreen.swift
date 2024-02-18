//
//  CountryListScreen.swift
//  WrkSpot
//
//  Created by Ravi Ranjan on 18/02/24.
//

import SwiftUI

struct CountryListScreen: View {
    @StateObject private var viewModel = CountryViewModel()
    @State var searchedText: String = ""
    
    var body: some View {
        ZStack {
            VStack {
                
                HStack {
                    Text("Country List")
                        .frame(maxWidth: .infinity, maxHeight:60)
                        .background(Color.blue)
                        .bold()
                        .font(.title2)
                        .foregroundColor(.white)
                }
                SearchBox(searchedText: $searchedText)
                
                ScrollView {
                    if viewModel.isLoading {
                        ProgressView("Loading...")
                    } else if viewModel.isError {
                        Text("Error: \(viewModel.errorMessage ?? "Unknown error")")
                            .foregroundColor(.red)
                    } else {
                        ForEach(viewModel.filteredCountryDetails ?? [], id: \.id) { countryDetail in
                            CountryView(countryDetail: countryDetail)
                                .padding(.leading)
                                .padding(.trailing)
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.loadCountryDetails()
        }
    }
}



#Preview {
    CountryListScreen()
}


