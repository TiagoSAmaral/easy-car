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

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

	override func awakeFromNib() {
		super.awakeFromNib()

		self.setBorders()
		self.setBackgroundColor()
	}

	private func setBackgroundColor() {

		self.backgroundColor = UIColor(red: 255.0/255.0, green: 201.0/255.0, blue: 0/255.0, alpha: 1.0)
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

	private func setBorders(){

		self.layer.cornerRadius = 10.0
	}

}
