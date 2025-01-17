//
//  EarthquakeViewModel.swift
//  Eartquake-Api
//
//  Created by Kevin  on 17-01-25.
//

import Foundation
import RxSwift

class EarthquakeViewModel: ObservableObject {
    private let earthquakeService = EarthquakeService()
    private let disposeBag = DisposeBag()

    @Published var earthquakes = [Feature]()
    @Published var errorMessage: String?

    func fetchEarthquakes(startTime: String, endTime: String) {
        earthquakeService.fetchEarthquakes(startTime: startTime, endTime: endTime) { [weak self] result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self?.earthquakes = response.features
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.errorMessage = ErrorHandler2.shared.handle(error)
                }
            }
        }
    }
}
