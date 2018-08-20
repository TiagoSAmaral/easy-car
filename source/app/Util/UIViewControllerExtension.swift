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

	func createButtonNavigationItem (target: UIViewController, selector: Selector, icon: String) -> UIBarButtonItem {

		let bttn: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 32, height: 22))
		bttn.titleLabel?.font = UIFont.icon(from: .fontAwesome, ofSize: 28)
		bttn.titleLabel?.text = String.fontAwesomeIcon(icon)
		bttn.setTitleColor(.black, for: .normal)
		bttn.addTarget(target.self, action: selector, for: .touchUpInside)
		bttn.parseIcon()

		return UIBarButtonItem(customView: bttn)
	}

	@objc func showAccount () {

		fatalError("Override showAccount function !")
	}
}
