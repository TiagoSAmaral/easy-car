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

//			let viewInstance = buildView( view.file, CarDetailViewController.identifier, CarDetailViewController.self)
//			viewInstance.presenter = CarDetailPresenter(view: viewInstance, router: self, vehicle: (data as? Vehicle)!)
//			self.view?.pushViewController(viewInstance, animated: true)

			print("Detail")

		case .cart:

			print("Bask")
//			let viewInstance = buildView(view.file, CartViewController.identifier, CartViewController.self)
//			viewInstance.presenter = CartPresenter(view: viewInstance, router: self)
//			viewInstance.modalPresentationStyle = .overCurrentContext
//
//			self.view?.pushViewController(viewInstance, animated: true)
		}
	}

	func buildView<T>(_ identifier: String, _ viewClass: T.Type) -> T{

		return UIStoryboard(name: identifier, bundle: nil).instantiateViewController(withIdentifier: identifier) as! T
	}
}
