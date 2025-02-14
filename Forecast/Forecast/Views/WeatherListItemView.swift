import SwiftUI

struct WeatherListItemView: View {
    let forecast: WeatherForecast
    let viewModel: WeatherForecastViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(forecast.dayOfWeek)
                .font(.headline)
            
            Text(viewModel.formatDate(forecast.date))
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1)
        )
        .padding(.vertical , 8)
    }
    
    // Helper function to format the date
    private func formatDate(_ dateString: String) -> String {
        let inputFormatter = ISO8601DateFormatter()
        guard let date = inputFormatter.date(from: dateString) else { return dateString }
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "dd.MM.yyyy"
        
        return outputFormatter.string(from: date)
    }
}
