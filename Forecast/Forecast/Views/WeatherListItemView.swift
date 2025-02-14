import SwiftUI

struct WeatherListItemView: View {
    let forecast: WeatherForecast

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(forecast.dayOfWeek)
                .font(.headline)

            Text(forecast.date)
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
}
