//
//  StringExtension.swift
//  easycar
//
//  Created by Tiago da Silva Amaral on 20/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import UIKit

extension String {

	func currency(value: Float) -> String? {

		let formatter = NumberFormatter()
		formatter.numberStyle = .currency
		if let formattedTipAmount = formatter.string(from: value as NSNumber) {
			return String(formattedTipAmount)
		}

		return nil
	}
}
