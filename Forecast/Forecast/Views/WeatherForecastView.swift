import SwiftUI

struct WeatherForecastView: View {
    @StateObject private var viewModel = WeatherForecastViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Weather Forecast")
                    .font(.headline)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.bottom)
                
                HStack {
                    Text("Location")
                        .font(.headline)
                    
                    Spacer()
                    
                    Text(viewModel.cityName)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).stroke())
                }
                List(viewModel.weatherData) { forecast in
                    ZStack {
                        WeatherListItemView(forecast: forecast, viewModel: viewModel)
                        NavigationLink(
                            "",
                            destination: DetailedWeatherView(
                                viewModel: DetailedWeatherViewModel(
                                    dayOfWeek: forecast.dayOfWeek
                                )
                            )
                        )
                        .opacity(
                            0
                        )
                    }
                    .listRowSeparator(.hidden)
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
