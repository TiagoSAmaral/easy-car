//
//  UIViewControllerExtension.swift
//  easycar
//
//  Created by Tiago da Silva Amaral on 20/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import UIKit
import  SwiftIconFont

extension UIViewController {

	func createButtonNavigationItem (target: UIViewController, selector: Selector?, icon: String?, text: String?, width: Int?) -> UIBarButtonItem {

		let widthButton = width != nil ? width! : 32
		let bttn: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: widthButton, height: 22))
		var textInternal: String = ""

		if let validIcon = icon {
			bttn.titleLabel?.font = UIFont.icon(from: .fontAwesome, ofSize: 28)
			textInternal.append(String.fontAwesomeIcon(validIcon)!)
		}

		if icon != nil && text != nil {
			textInternal.append(" ")
		}

		if let validTexdt = text {
			textInternal.append(validTexdt)
		}

		if let validMethod = selector {
			bttn.addTarget(target.self, action: validMethod, for: .touchUpInside)
		}

		bttn.titleLabel!.text = textInternal
		bttn.setTitleColor(.black, for: .normal)
		bttn.parseIcon()

		return UIBarButtonItem(customView: bttn)
	}

	func showAlert(with title: String, and message: String, completion: (() -> Void)?) {

		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "Fechar", style: .cancel, handler: nil))
		self.present(alert, animated: true, completion: completion)
	}

	func setBackButtonTitle(with text: String) {

		self.navigationItem.backBarButtonItem = UIBarButtonItem(title: text, style: UIBarButtonItemStyle.plain, target: nil, action: nil)
	}

	func setNavigationTitleView(with text: String) {

		self.navigationItem.title = text
	}
}
