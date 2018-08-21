//
//  RouterTests.swift
//  easycarTests
//
//  Created by Tiago da Silva Amaral on 21/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import Quick
import Nimble
@testable import easycar

class RouterTests: QuickSpec {

	override func spec() {

		describe("Test Router") {

			context("On init", closure: {

				var routerView: RouterView!
				var routerPresenter: Router!
				beforeEach {

					routerView = RouterView()
					routerPresenter = Router(view: routerView)
					routerView.presenter = routerPresenter
				}

				it("Check Presenter in View", closure: {

					expect(routerView.presenter).toNot(beNil())
				})

				it("Check View in Presenter", closure: {

					expect(routerPresenter.view).toNot(beNil())
				})
			})

			context("Router", closure:{

				var routerView: RouterView!
				var routerPresenter: Router!
				beforeEach {

					routerView = RouterView()
					routerPresenter = Router(view: routerView)
					routerView.presenter = routerPresenter
				}

				it("Check method goTo", closure: {

					routerPresenter.goTo(view: .shop, pushForward: nil)
					expect(routerView.visibleViewController).toEventually(beAnInstanceOf(ShopView.self))
				})

				it("Check buildView", closure: {

					let view = routerPresenter.buildView(ShopView.identifier, ShopView.self)
					expect(view).toEventually(beAnInstanceOf(ShopView.self))
				})
			})
		}
	}
}
