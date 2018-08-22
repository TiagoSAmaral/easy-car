//
//  Vehicle.swift
//  easycar
//
//  Created by Tiago da Silva Amaral on 21/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyJSON

class Vehicle: Object {

	@objc dynamic var identifier: Int = 0
	@objc dynamic var name: String = ""
	@objc dynamic var detail: String = ""
	@objc dynamic var brand: String = ""
	@objc dynamic var amount: Int = 0
	@objc dynamic var price: Float = 0.0
	@objc dynamic var image: String = ""
	@objc dynamic var page: Int = 0

	static func newVehicle(json: JSON) -> Vehicle {

		let vehicle = Vehicle()
		let jsonDic = json.dictionary!

		vehicle.identifier = jsonDic["id"]!.int!
		vehicle.name = jsonDic["nome"]!.string!
		vehicle.detail = jsonDic["descricao"]!.string!
		vehicle.brand = jsonDic["marca"]!.string!
		vehicle.amount = jsonDic["quantidade"]!.int!
		vehicle.price = jsonDic["preco"]!.floatValue
		vehicle.image = jsonDic["imagem"]!.string!

		return vehicle
	}

	static func newVehicles(with data: Data?) -> [Vehicle]? {

		guard let validData = data else {
			return nil
		}

		let json = JSON(validData)

		if json.arrayValue.isEmpty {
			return nil
		}

		var vehicles: [Vehicle] = [Vehicle]()

		for jsonObj in json.arrayValue {

			vehicles.append(Vehicle.newVehicle(json: jsonObj))
		}

		return vehicles
	}
}
