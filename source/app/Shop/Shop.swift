//
//  Shop.swift
//  easycar
//
//  Created by Tiago da Silva Amaral on 21/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import UIKit

protocol ShopInterface: class{

	func goToBasket()
	func selectedVehicler(index: Int)
	func buildCell(to tableView: UITableView, at indexPath: IndexPath) -> ShopCell
	func getSizeList() -> Int
	func addNewCarTorOrder(at index: Int)
	func getMessageTableView() -> String
	func viewWillAppear()
}

class Shop: NSObject, ShopInterface{

	weak var view: ShopViewInterface?
	var router: RouterInterface?
	var network: ShopNetwork?
	var vehicles: [Vehicle] = [Vehicle]()
	var messageTableView: String = ""

	init(view: ShopViewInterface, router: RouterInterface){

		self.view = view
		self.router = router
		self.network = ShopNetwork()
		self.view!.setBackButtonTitle(with: " ")
		self.view!.setNavigationTitleView(with: "Easy Car")
	}

	func viewWillAppear() {
		self.requestVehicles()
	}

	func goToBasket() {
		self.router?.goTo(view: .basket, pushForward: nil)
	}

	func selectedVehicler(index: Int) {
		self.router!.goTo(view: .detail, pushForward: self.vehicles[index])
	}

	func addNewCarTorOrder(at index: Int) {

	}

	func buildCell(to tableView: UITableView, at indexPath: IndexPath) -> ShopCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: ShopCell.identifier, for: indexPath) as! ShopCell
		cell.setupCell(vehicle: self.vehicles[indexPath.row])
		cell.delegate = self
		return cell
	}

	func getSizeList() -> Int {
		return self.vehicles.count
	}

	func getMessageTableView() -> String {
		return self.messageTableView
	}

	func requestVehicles() {

		if self.getSizeList() != 0 {
			return
		}

		self.messageTableView = "Carregando Veículos"
		self.network?.getCars { (results, error) in

			if error != nil {

				self.showErrorMessage()

			} else {

				if results == nil {

					self.showEmptyResultMessage()

				} else {

					self.updateWithNew(vehicles: results!)
				}
			}
		}
	}

	func showErrorMessage() {

		self.messageTableView = "Infelizmente ocorreu um problema. Verifique sua conexão de rede e tente novamente."
		self.view!.showAlert(with: "Ocorrou um problema", and: "Infelizmente ocorreu um problema. Verifique sua conexão de rede e tente novamente.", completion: {
			self.view!.hideLoading()
			self.view!.reloadData()
		})
	}

	func showEmptyResultMessage() {

		self.messageTableView = "Em breve teremos mais itens para você."
		self.view!.showAlert(with: "", and: "Em breve termos mais itens para você.", completion: {
			self.view!.hideLoading()
			self.view!.reloadData()
		})
	}

	func updateWithNew(vehicles: [Vehicle]) {

		self.messageTableView = ""
		self.vehicles = vehicles
		self.view!.reloadData()
	}
}
