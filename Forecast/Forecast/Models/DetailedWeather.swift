//
//  DetailedWeather.swift
//  Forecast
//
//  Created by Renan Diniz on 13/02/25.
//


import Foundation

struct DetailedWeather: Identifiable {
    let id = UUID()
    let weatherCondition: String
    let temperature: Int
    let lowestTemperature: Int
    let probabilityOfRain: Int
    let humidity: Double
    let windSpeed: Int
    let windDirection: String
    let uvIndex: Int
    let visibility: Int
    let airPressure: Int
    let sunrise: String
    let sunset: String
}
