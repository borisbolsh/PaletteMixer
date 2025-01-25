import SwiftUI

struct ChooseColorView: View {
	let colors: [Color]
	@Binding var selectedColor: Color
	@Binding var isShowingColorPicker: Bool
	@StateObject private var languageManager = LanguageManager.shared

	var body: some View {
		NavigationView() {
			VStack(alignment: .leading) {
				ForEach(colors, id: \.self) { color in
					Button(action: {
						selectedColor = color
						isShowingColorPicker = false
					}) {
						HStack {
							RoundedRectangle(cornerRadius: Grid.radius12)
								.fill(color)
								.frame(width: Grid.size64.width, height: Grid.size64.height)
							Text(color.description.capitalized)
								.frame(maxWidth: .infinity, alignment: .leading)

						}
						.padding(.horizontal, Grid.padding8)
					}
				}
			}
			.frame(maxHeight: .infinity, alignment: .topLeading)
			.navigationTitle(languageManager.loc(forKey: "Choose color"))
			.navigationBarTitleDisplayMode(.inline)
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					Button(languageManager.loc(forKey: "Close")) {
						isShowingColorPicker = false
					}
				}
			}
		}
	}
}
