//
//  ContentView.swift
//  Eartquake-Api
//
//  Created by Kevin  on 16-01-25.
//

import SwiftUI
import RxSwift
import RxCocoa

struct ContentView: View {
    @StateObject private var viewModel = EarthquakeViewModel()
    @State private var startTime: String = "2020-01-01"
    @State private var endTime: String = "2020-01-02"

    var body: some View {
        NavigationView {
            VStack {
                TextField("Start Time (YYYY-MM-DD)", text: $startTime)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                TextField("End Time (YYYY-MM-DD)", text: $endTime)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Button(action: {
                    viewModel.fetchEarthquakes(startTime: startTime, endTime: endTime)
                }) {
                    Text("Fetch Earthquakes")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }
                List(viewModel.earthquakes, id: .id) { earthquake in
                    VStack(alignment: .leading) {
                        Text("Place: (earthquake.properties.place)")
                            .font(.headline)
                        Text("Magnitude: (earthquake.properties.mag)")
                            .font(.subheadline)
                        Text("Time: (Date(timeIntervalSince1970: TimeInterval(earthquake.properties.time / 1000)))")
                            .font(.footnote)
                    }
                }
            }
            .navigationTitle("Earthquakes")
        }
    }
}
