import SwiftUI

final class WeatherForecastViewModel: ObservableObject {
    @Published var weatherData: [WeatherForecast] = []
    @Published var cityName: String = "Loading..."
    
    private let weatherService = WeatherService()

    func fetchWeather() async {
        do {
            let result = try await withCheckedThrowingContinuation { continuation in
                weatherService.fetchWeatherData { result in
                    continuation.resume(with: result)
                }
            }

            DispatchQueue.main.async {
                self.cityName = "San Francisco" // Mock location city name
                self.weatherData = self.mapToForecast(result.timelines.daily ?? [])
            }
        } catch {
            DispatchQueue.main.async {
                self.cityName = "Error loading data"
            }
        }
    }

    private func mapToForecast(_ dailyData: [Daily]) -> [WeatherForecast] {
        return dailyData.enumerated().map { index, daily in
            WeatherForecast(
                dayOfWeek: DateFormatter.localizedString(from: Calendar.current.date(byAdding: .day, value: index, to: Date()) ?? Date(), dateStyle: .full, timeStyle: .none),
                date: daily.values.sunriseTime // Example usage of the API data
            )
        }
    }
}
