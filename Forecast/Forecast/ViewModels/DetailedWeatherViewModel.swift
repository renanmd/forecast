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
}
