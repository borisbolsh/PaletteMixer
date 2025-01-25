import Foundation
import SwiftUI

enum LanguageType: String {
	case english = "en"
	case russian = "ru"
}

enum UserDefaultsKeys: String {
	case selectedLanguage = "selectedLanguage"
}

final class LanguageManager: ObservableObject {
	static let shared = LanguageManager()

	@Published var currentLanguage: String {
		didSet { setLanguage(currentLanguage) }
	}

	let availableLanguages = [
		LanguageType.english.rawValue,
		LanguageType.russian.rawValue
	]

	private var currentBundle = Bundle.main

	private init() {
		currentLanguage = UserDefaults.standard.string(forKey: UserDefaultsKeys.selectedLanguage.rawValue) ?? LanguageType.english.rawValue
		updateBundle()
	}

	func loc(forKey key: String) -> String {
		return currentBundle.localizedString(forKey: key, value: nil, table: nil)
	}

	private func setLanguage(_ language: String) {
		guard availableLanguages.contains(language) else { return }

		UserDefaults.standard.set(language, forKey: UserDefaultsKeys.selectedLanguage.rawValue)
		updateBundle()
	}

	private func updateBundle() {
		if let path = Bundle.main.path(forResource: currentLanguage, ofType: "lproj"),
			 let bundle = Bundle(path: path) {
			currentBundle = bundle
		} else {
			currentBundle = Bundle.main
		}
	}
}
