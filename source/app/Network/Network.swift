//
//  Network.swift
//  easycar
//
//  Created by Tiago da Silva Amaral on 20/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import UIKit
import Alamofire

protocol NetworkInterface {

	func request(
		_ address: String,
		operation: HTTPMethod,
		params: [String: Any]?,
		completion: @escaping (Data?, Error?) -> Void)
}

class Network: NetworkInterface {

	func request(_ address: String, operation: HTTPMethod, params: [String: Any]?, completion: @escaping (Data?, Error?) -> Void) {

		UIApplication.shared.isNetworkActivityIndicatorVisible = true

		Alamofire.request(address, method: operation, parameters: params, encoding: URLEncoding.default).responseJSON { (response) in

			UIApplication.shared.isNetworkActivityIndicatorVisible = false
			completion(response.data, response.error)

		}
	}

}
