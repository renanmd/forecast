//
//  DetailedWeatherViewModel.swift
//  Forecast
//
//  Created by Renan Diniz on 13/02/25.
//


import Foundation

final class DetailedWeatherViewModel: ObservableObject {
    @Published var dayOfWeek: String
    @Published var weatherCondition: String = "Mostly Sunny"
    @Published var temperature: Int = 24
    @Published var lowestTemperature: Int = 18
    @Published var probabilityOfRain: Int = 9
    @Published var humidity: Double = 75.0
    @Published var windSpeed: Int = 16
    @Published var windDirection: String = "NE"
    @Published var uvIndex: Int = 7
    @Published var visibility: Int = 927
    @Published var airPressure: Int = 1024
    @Published var sunrise: String = "06:44 Uhr"
    @Published var sunset: String = "19:14 Uhr"

    init(dayOfWeek: String) {
        self.dayOfWeek = dayOfWeek
    }

    func fetchDetailedWeather() async {
        // Mocked API response
        await Task.sleep(1_000_000_000) // Simulate delay
        DispatchQueue.main.async {
            // Populate with mocked data (already set above)
        }
    }
}
