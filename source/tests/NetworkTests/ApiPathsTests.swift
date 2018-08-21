//
//  ApiPathsTests.swift
//  easycarTests
//
//  Created by Tiago da Silva Amaral on 21/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import easycar

class ApiPathTests: QuickSpec {

	override func spec() {

		describe("Test bulid Url Paths") {

			context("Paths in Debug", closure: {

				var apiPath: ApiPaths!

				beforeEach {
					apiPath = ApiPaths()
				}

				// Puts test code here
				it("Get list movies Url DEBUG", closure: {
					expect(apiPath.urlListVehicles).to(equal(URL(string: "http://localhost:3001/vehicles")!))
				})
			})
		}
	}
}

