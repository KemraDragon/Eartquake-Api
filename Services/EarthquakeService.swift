//
//  EarthquakeService.swift
//  Eartquake-Api
//
//  Created by Kevin  on 17-01-25.
//

import Foundation
import Alamofire

class EarthquakeService {
    private let baseURL = "https://earthquake.usgs.gov/fdsnws/event/1/query"

    func fetchEarthquakes(startTime: String, endTime: String, completion: @escaping (Result<EarthquakeResponse, Error>) -> Void) {
        let parameters: [String: String] = [
            "format": "geojson",
            "starttime": startTime,
            "endtime": endTime
        ]

        AF.request(baseURL, parameters: parameters).responseDecodable(of: EarthquakeResponse.self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
