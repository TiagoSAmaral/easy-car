//
//  ShopTests.swift
//  easycarTests
//
//  Created by Tiago da Silva Amaral on 22/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import Quick
import Nimble
@testable import easycar

class ShopTests: QuickSpec {

	let stubs: Stubs = Stubs()

	override func setUp() {
		super.setUp()

		self.stubs.stubGetConnection(file: "mocklistcar", host: "localhost", in: "/v1/carro/")
	}

	override func spec() {
		
        describe("Test Shop") {

			context("", closure: {

				var shop: Shop!
				var shopView: ShopView!
				var routerView: RouterView!

				beforeEach {

                    // Run before each test
					let elements = self.instantiate()

					shop = elements["Presenter"] as!Shop
					shopView = elements["View"] as! ShopView
					routerView = elements["Navigation"] as! RouterView
                }

                afterEach{

                     // Run after each test
                }

                // Puts test code here
				it("Check Navigate to Detail", closure: {
					shop.vehicles = self.loadVehicles()
					shop.selectedVehicler(index: 0)
					expect(routerView.visibleViewController).toEventually(beAnInstanceOf(VehicleDetailView.self), timeout: 3)
				})

				it("Check Navigate to Basket", closure: {
					shop.goToBasket()
					expect(routerView.visibleViewController).toEventually(beAnInstanceOf(BasketView.self), timeout: 3)
				})

				it("Check Build Cell", closure: {
					shop.vehicles = self.loadVehicles()
					let cell = shop.buildCell(to: shopView.tableView, at: IndexPath(item: 0, section: 0))
					expect(cell.identifier).to(equal(1))
					expect(cell.name.text).to(equal("Nissan GT-R"))
					expect(cell.delegate).to(beAnInstanceOf(Shop.self))
				})

				it("Check SizeList ", closure: {
					shop.vehicles = self.loadVehicles()
					expect(shop.getSizeList()).to(equal(19))
				})

				it("Check Request Vehicles Success Path", closure: {
					shop.requestVehicles()
					expect(shop.getSizeList()).toEventually(equal(19))
				})

				it("Check Show message Error Request", closure: {
					shop.showErrorMessage()
					let expectedMessage = "Infelizmente ocorreu um problema. Verifique sua conexão de rede e tente novamente."
					expect(shop.messageTableView).to(equal(expectedMessage))
				})

				it("Check Show message Result empty", closure: {
					shop.showEmptyResultMessage()
					let expectedMessage = "Em breve teremos mais itens para você."
					expect(shop.messageTableView).to(equal(expectedMessage))
				})

				it("Check UpdateView", closure: {
					shop.updateWithNew(vehicles: self.loadVehicles())
					expect(shop.getSizeList()).to(equal(19))
				})
            })
        }
	}

	func instantiate() -> [String: Any] {

		let routerView = RouterView()
		routerView.presenter = Router(view: routerView)
		routerView.presenter.goTo(view: .shop, pushForward: nil)
		routerView.viewWillAppear(true)

		let shopView = routerView.visibleViewController as! ShopView
		let shop = shopView.presenter as! Shop

		return ["View": shopView, "Navigation": routerView, "Presenter": shop]
	}

	func loadVehicles() -> [Vehicle] {

		let data = Stubs.loadFile(named: "mocklistcar")
		return Vehicle.newVehicles(with: data)!
	}
}
