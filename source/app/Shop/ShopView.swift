//
//  ViewController.swift
//  easycar
//
//  Created by Tiago da Silva Amaral on 14/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import UIKit

protocol ShopViewInterface: class {
	func reloadData()
	func showAlert(with title: String, and message: String, completion: (() -> Void)?)
	func setBackButtonTitle(with text: String)
	func setNavigationTitleView(with text: String)
	func hideLoading()
}

class ShopView: UITableViewController, ShopViewInterface {

	var presenter: ShopInterface!

	override func viewDidLoad() {
		super.viewDidLoad()
		self.tableView = UITableView(frame: CGRect.zero)
		self.setupNavigationButton()
		self.registerProductCell()

		self.tableView.rowHeight = UITableViewAutomaticDimension
		self.tableView.estimatedRowHeight = 160
		self.tableView.rowHeight = 160
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewDidAppear(animated)

		self.presenter.viewWillAppear()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@objc private func showBasket() {
		self.presenter?.goToBasket()
	}

	func hideLoading() {

	}

	func setupNavigationButton() {
		self.navigationItem.rightBarButtonItem = self.createButtonNavigationItem(target: self, selector: #selector(showBasket), icon: "shoppingcart", text: nil, width: 30)
	}

	func registerProductCell() {
		tableView.register(UINib(nibName: ShopCell.identifier, bundle: nil), forCellReuseIdentifier: ShopCell.identifier)
	}

	func reloadData() {

		self.hideLoading()
		self.tableView.reloadData()
	}

	// MARK: - Table view data source

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.showMessageTableEmpty(text: self.presenter!.getMessageTableView(), amount: self.presenter!.getSizeList(), tableView: tableView)
	}

	override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		(cell as! ShopCell).willBeRecycled()
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return self.presenter!.buildCell(to: tableView, at: indexPath)
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		self.presenter!.selectedVehicler(index: indexPath.row)
	}

}
