//
//  WeatherModel.swift
//  weatherr
//
//  Created by dan on 27.04.2023.
//

import Foundation


class WeatherModel: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
    
    class Main: Decodable {
        let temp: Double
    }
    
    class Weather: Decodable {
        let id: Int
    }
}
