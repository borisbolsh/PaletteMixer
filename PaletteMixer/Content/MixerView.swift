import SwiftUI

struct MixerView: View {
	@StateObject private var viewModel = MixerViewModel()
	@State private var isShowingColorPicker = false
	@StateObject private var languageManager = LanguageManager.shared
	@State private var selectedColorIndex = 0

	var body: some View {
		ScrollView {
			VStack(spacing: 30) {
				HeaderView()

				ColorView(color: $viewModel.firstColor) {
					selectedColorIndex = 0
					isShowingColorPicker = true
				}

				ColorView(color: $viewModel.secondColor) {
					selectedColorIndex = 1
					isShowingColorPicker = true
				}

				Text(я"Result"))
					.font(.headline)
				RoundedRectangle(cornerRadius: Grid.radius12)
					.fill(viewModel.mixedColor)
					.frame(width: Grid.size128.width, height: Grid.size128.height)
			}
			.padding()
			.sheet(isPresented: $isShowingColorPicker) {
				ChooseColorView(colors: viewModel.colors, selectedColor: selectedColorIndex == 0 ? $viewModel.firstColor : $viewModel.secondColor, isShowingColorPicker: $isShowingColorPicker)
			}
		}
	}
}

#Preview {
	MixerView()
}

