import SwiftUI

struct WeatherForecastView: View {
    @StateObject private var viewModel = WeatherForecastViewModel()

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                // Title
                Text("Weather Forecast")
                    .font(.headline)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.bottom)

                // Location Section
                HStack {
                    Text("Location")
                        .font(.headline)

                    Spacer()

                    Text(viewModel.cityName)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).stroke())
                }

                // Weather List with NavigationLink
                List(viewModel.weatherData) { forecast in
                    ZStack {
                        WeatherListItemView(forecast: forecast)
//                            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                        NavigationLink("", destination: DetailedWeatherView(viewModel: DetailedWeatherViewModel(dayOfWeek: forecast.dayOfWeek)))
                            .opacity(0) // Invisible but still functional
                    }
                    .listRowSeparator(.hidden)
//                    .listRowInsets(EdgeInsets()) // Remove default padding
                    .listRowBackground(Color.clear)
                }
                .listStyle(PlainListStyle())

                Spacer()
            }
            .padding()
        }
        .task {
            await viewModel.fetchWeather()
        }
    }
}
