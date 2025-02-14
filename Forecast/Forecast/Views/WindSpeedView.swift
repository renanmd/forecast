import SwiftUI

struct WindSpeedView: View {
    let windSpeed: Int
    let windDirection: String
    var body: some View {
        VStackLayout(alignment: .leading, spacing: 8) {
            HStack {
                Text("Maximum wind speed")
                    .font(.caption)
                Spacer()
                Text("\(windSpeed) km/h")
                    .font(.caption)
            }
            Text("Wind direction")
                .font(.caption)
            VStack {
                Image(systemName: "arrow.up")
                    .font(.system(size: 60))
                    .rotationEffect(angleForDirection(windDirection))
                    .foregroundColor(.blue)
                Text(windDirection)
                    .font(.caption)
            }
            .frame(maxWidth: .infinity, alignment: .center)
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
    
    func angleForDirection(_ direction: String) -> Angle {
            switch direction {
            case "N": return .degrees(0)
            case "NE": return .degrees(45)
            case "E": return .degrees(90)
            case "SE": return .degrees(135)
            case "S": return .degrees(180)
            case "SW": return .degrees(225)
            case "W": return .degrees(270)
            case "NW": return .degrees(315)
            default: return .degrees(0)
            }
        }
}
