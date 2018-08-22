//
//  StringExtension.swift
//  easycar
//
//  Created by Tiago da Silva Amaral on 20/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import UIKit

extension Float {

	func currency(in locale: CustomLocale) -> String {

		let formatter = NumberFormatter()
		// Change this to another locale if you want to force a specific locale, otherwise this is redundant as the current locale is the default already
		formatter.locale = locale.value
		formatter.numberStyle = .currency

		return String(formatter.string(from: self as NSNumber)!)

	}
}

enum CustomLocale{

	case brazil
	case unitstate

	var value: Locale {
		switch self {
		case .brazil:
			return Locale(identifier: "pt_BR")
		case .unitstate:
			return Locale(identifier: "en_US")
		}
	}
}
