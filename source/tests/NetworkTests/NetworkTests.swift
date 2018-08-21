//
//  NetworkTests.swift
//  easycarTests
//
//  Created by Tiago da Silva Amaral on 21/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import Foundation

import Quick
import Nimble
@testable import easycar

class NetworkTests: QuickSpec {

	let stubs: Stubs = Stubs()

	override func setUp() {
		super.setUp()

		self.stubs.stubGetConnection(file: "mocklistcar", host: "localhost", in: "")
	}

	override func spec() {

		afterSuite {
			Stubs.clearStubs()
		}

		describe("Test Network class") {

			context("", closure: {

				var network: NetworkInterface!

				beforeEach {

					// Run before each test
					network = Network()
				}

				// Puts test code here
				it("Test Get Method", closure: { waitUntil { done in

					let url = URL(string: "http://localhost")!

					network.request(url, operation: .get, params: nil, completion: { (data, error) in

						let resultString = String(data: data!, encoding: String.Encoding.utf8)
						expect(resultString).toNot(equal(""))
						expect(error).to(beNil())
						done()
					})
				}})
			})
		}
	}
}

