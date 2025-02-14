
struct WeatherResponse: Codable {
    let timelines: Timelines
    let location: Location
}

struct Timelines: Codable {
    let daily: [Daily]
}

struct Daily: Codable {
    let time: String
    let values: Values
}

struct Values: Codable {
    let cloudCoverAvg: Double
    let humidityAvg: Double
    let precipitationProbabilityAvg: Double
    let pressureSurfaceLevelAvg: Double
    let sunriseTime: String
    let sunsetTime: String
    let temperatureMax: Double
    let temperatureMin: Double
    let uvIndexMax: Double?
    let uvIndexMin: Double?
    let visibilityAvg: Double
    let windDirectionAvg: Double
    let windSpeedAvg: Double
}

struct Location: Codable {
    let lat: Double
    let lon: Double
}
