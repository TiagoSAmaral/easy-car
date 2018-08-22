//
//  APIPaths.swift
//  easycar
//
//  Created by Tiago da Silva Amaral on 21/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import Foundation

protocol ApiPathsInterface {

	var urlListVehicles: URL { get }
}

class ApiPaths: ApiPathsInterface {

	fileprivate let enviroment: Environment = Environment()
	fileprivate var urlBase: String!

	init() {

		switch enviroment.current {
		case .debug:
			self.urlBase = "http://localhost:3001"
		case .release:
			self.urlBase = "http://desafiobrq.herokuapp.com"
		}
	}

	var urlListVehicles: URL {
		self.urlBase.append("/v1/carro/")
		return URL(string: self.urlBase)!
	}
}
