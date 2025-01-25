import SwiftUI

struct HeaderView: View {
	@StateObject private var languageManager = LanguageManager.shared

	var body: some View {
		HStack {
			Text("PaletteMixer")
				.font(.title)
				.fontWeight(.medium)
			Spacer()

			Picker("", selection: $languageManager.currentLanguage) {
				ForEach(Array(languageManager.availableLanguages.enumerated()), id: \.element) { index, lang in
					Text(lang.uppercased())
						.tag(index)
				}
			}
			.pickerStyle(.segmented)
			.frame(width: Grid.size128.width)
		}
	}
}
