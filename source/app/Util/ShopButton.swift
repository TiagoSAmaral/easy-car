//
//  ShopButton.swift
//  easycar
//
//  Created by Tiago da Silva Amaral on 20/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import UIKit
import SwiftIconFont

class ShopButton: UIButton {

	override func awakeFromNib() {
		super.awakeFromNib()

		self.setBorders()
		self.setBackgroundColor()
	}

	func setLabel(icon: String?, text: String?, fontSize: CGFloat) {

		var finalText = String()

		if let iconText = icon {

			self.titleLabel?.font = UIFont.icon(from: .fontAwesome, ofSize: fontSize)
			finalText = String.fontAwesomeIcon(iconText)!
		}

		if let labelText = text {

			finalText.append(" " + labelText)
		}

		self.titleLabel?.text = finalText
		self.setTitleColor(.black, for: .normal)
		self.parseIcon()
	}

	func setBackgroundColor() {

		self.backgroundColor = Colors.primary.value
	}

	func setBorders(){

		self.layer.cornerRadius = 10.0
	}

}
