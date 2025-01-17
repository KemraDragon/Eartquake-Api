//
//  EarthquakeModel.swift
//  Eartquake-Api
//
//  Created by Kevin  on 17-01-25.
//

import Foundation
struct EarthquakeResponse: Decodable {
    let features: [Feature]
}

struct Feature: Decodable {
    let properties: Properties
    let geometry: Geometry
}

struct Properties: Decodable {
    let mag: Double
    let place: String
    let time: Int64
}

struct Geometry: Decodable {
    let coordinates: [Double]
}
