import SwiftUI
import CoreLocation

struct WeatherService {
    private let apiKey = "nYAiIPQpvZU7IE7nWwwAqVa3ukmt8zrk"
    private let baseURL = "https://api.tomorrow.io/v4/weather/forecast"
    
    func fetchWeatherData(completion: @escaping (Result<WeatherResponse, Error>) -> Void) {
        let mockLocation = CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194) // San Francisco, CA
        
        let locationString = "\(mockLocation.latitude),\(mockLocation.longitude)"
        
        guard let url = URL(string: "\(baseURL)?location=\(locationString)&timesteps=daily&units=metric&apikey=\(apiKey)") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("RMD - No data received")
                completion(.failure(NSError(domain: "No data received", code: 0)))
                return
            }
            
            if let error = error {
                print("RMD2 - \(error)")
                completion(.failure(error))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let weatherResponse = try decoder.decode(WeatherResponse.self, from: data)
                completion(.success(weatherResponse))
            } catch {
                print("RMD3 - \(error)")
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
