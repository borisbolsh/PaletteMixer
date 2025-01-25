import SwiftUI

final class MixerViewModel: ObservableObject {
	let colors: [Color] = [.red, .yellow, .blue, .green, .purple, .orange]

	@Published var firstColor: Color = .red { didSet { mixColors() } }
	@Published var secondColor: Color = .yellow { didSet { mixColors() } }
	@Published var mixedColor: Color  = .clear

	init() {
		mixColors()
	}
	
	private func mixColors() {
		let uiColor1 = UIColor(firstColor)
		let uiColor2 = UIColor(secondColor)

		var red1: CGFloat = 0
		var green1: CGFloat = 0
		var blue1: CGFloat = 0
		var alpha1: CGFloat = 0

		var red2: CGFloat = 0
		var green2: CGFloat = 0
		var blue2: CGFloat = 0
		var alpha2: CGFloat = 0

		uiColor1.getRed(&red1, green: &green1, blue: &blue1, alpha: &alpha1)
		uiColor2.getRed(&red2, green: &green2, blue: &blue2, alpha: &alpha2)

		let mixedRed = (red1 + red2) / 2
		let mixedGreen = (green1 + green2) / 2
		let mixedBlue = (blue1 + blue2) / 2

		mixedColor = Color(red: mixedRed, green: mixedGreen, blue: mixedBlue)
	}
}
