//
//  RouterView.swift
//  easycar
//
//  Created by Tiago da Silva Amaral on 21/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import UIKit

protocol RouterViewInterface: class {

	func setViewControllers(_: [UIViewController], animated: Bool)
	func pushViewController(_: UIViewController, animated: Bool)
}

class RouterView: UINavigationController, RouterViewInterface {

	var presenter: RouterInterface!

	override func viewDidLoad() {
		super.viewDidLoad()

	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

}
