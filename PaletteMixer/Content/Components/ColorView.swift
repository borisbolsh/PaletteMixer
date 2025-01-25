import SwiftUI

struct ColorView: View {
	@Binding var color: Color
	let action: () -> Void

	var body: some View {
		Button {
			action()
		} label: {
			VStack {
				Text(color.description.capitalized)
				RoundedRectangle(cornerRadius: Grid.radius12)
					.fill(color)
					.frame(width: Grid.size128.width, height: Grid.size128.height)
			}
		}
	}
}
