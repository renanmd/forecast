import SwiftUI

final class WeatherForecastViewModel: ObservableObject {
    @Published var weatherData: [WeatherForecast] = []
    @Published var cityName: String = "Loading..."

    func fetchWeather() async {
        // Mock data for now
        await Task.sleep(1_000_000_000) // Simulate network delay
        DispatchQueue.main.async {
            self.cityName = "New York"
            self.weatherData = [
                WeatherForecast(dayOfWeek: "Monday", date: Date()),
                WeatherForecast(dayOfWeek: "Tuesday", date: Date().addingTimeInterval(86400)),
                WeatherForecast(dayOfWeek: "Wednesday", date: Date().addingTimeInterval(2 * 86400))
            ]
        }
    }
}
