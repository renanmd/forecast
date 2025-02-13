import SwiftUI

struct WeatherForecast: Identifiable {
    let id = UUID()
    let dayOfWeek: String
    let date: Date

    var dateFormatted: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy"
        return formatter.string(from: date)
    }
}
