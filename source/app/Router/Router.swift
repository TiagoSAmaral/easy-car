//
//  Router.swift
//  easycar
//
//  Created by Tiago da Silva Amaral on 21/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import UIKit

protocol RouterInterface{

	func goTo(view: Routes, pushForward data: Any?)
}

class Router: NSObject, RouterInterface{

	weak var view: RouterViewInterface!

	init(view: RouterViewInterface){
		super.init()

		self.view = view
	}

	func goTo(view: Routes, pushForward data: Any?){

		switch view {

		case .shop :

			let shopView = buildView(ShopView.identifier, ShopView.self)
			shopView.presenter = Shop(view: shopView, router: self)
			self.view.setViewControllers([shopView], animated: false)

		case .detail:

			let viewInstance = buildView(VehicleDetailView.identifier, VehicleDetailView.self)
			self.view.pushViewController(viewInstance, animated: true)

		case .basket:

			let viewInstance = buildView(BasketView.identifier, BasketView.self)
			viewInstance.modalPresentationStyle = .overCurrentContext
			self.view.pushViewController(viewInstance, animated: true)
		}
	}

	func buildView<T>(_ identifier: String, _ viewClass: T.Type) -> T{

		return UIStoryboard(name: identifier, bundle: nil).instantiateViewController(withIdentifier: identifier) as! T
	}
}
