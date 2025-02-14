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
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        
        return dailyData.enumerated().map { index, daily in
            WeatherForecast(
                dayOfWeek: formatter.string(from: Calendar.current.date(byAdding: .day, value: index, to: Date()) ?? Date()),
                date: daily.values.sunriseTime // Example usage of the API data
            )
        }
    }
    
    func formatDate(_ dateString: String) -> String {
            let inputFormatter = ISO8601DateFormatter()
            guard let date = inputFormatter.date(from: dateString) else { return dateString }
            
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "dd.MM.yyyy"
            
            return outputFormatter.string(from: date)
        }
}
