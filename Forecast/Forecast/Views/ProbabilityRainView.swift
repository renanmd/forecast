import SwiftUI

struct ProbabilityRainView: View {
    let probabilityRain: Int
    let averageHumidity: Int
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Average probability of rain")
                    .font(.caption)
                Spacer()
                Text("\(probabilityRain)%")
                    .font(.caption)
            }
            
            HStack {
                Text("Average humidity")
                    .font(.caption)
                Spacer()
                Text("\(averageHumidity)%")
                    .font(.caption)
            }
            
            ProgressView(value: Double(averageHumidity), total: 100)
                            .progressViewStyle(LinearProgressViewStyle(tint: .blue))
                            .scaleEffect(x: 1, y: 2, anchor: .center)
        }
        .padding()
        .background(
            RoundedRectangle(
                cornerRadius: 10
            ).stroke(
                Color.gray,
                lineWidth: 1
            ).background(
                RoundedRectangle(
                    cornerRadius: 10
                ).fill(
                    Color.white
                )
            )
        )
        .padding(.vertical, 8)
    }
}
