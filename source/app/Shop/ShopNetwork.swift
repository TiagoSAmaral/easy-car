//
//  ShopNetwork.swift
//  easycar
//
//  Created by Tiago da Silva Amaral on 21/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import Foundation

protocol ShopNetworkInterface {

	func getCars(completionHandler: @escaping ([Vehicle]?, Error?) -> Void)
}

class ShopNetwork: ShopNetworkInterface {

	private let apiPaths: ApiPathsInterface = ApiPaths()
	private let network: NetworkInterface = Network()

	func getCars(completionHandler: @escaping ([Vehicle]?, Error?) -> Void){

		network.request(apiPaths.urlListVehicles, operation: .get, params: nil) { (data, error) in

			completionHandler(Vehicle.newVehicles(with: data), error)
		}
	}
}
