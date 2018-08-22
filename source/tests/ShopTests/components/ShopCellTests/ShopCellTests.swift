//
//  ShopCellTests.swift
//  easycarTests
//
//  Created by Tiago da Silva Amaral on 21/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import Quick
import Nimble
@testable import easycar

class ShopCellTests: QuickSpec {

	override func spec() {
		
        describe("Test Cell Presented in Shop List") {

			context("", closure: {

				var cell: ShopCell!
				beforeEach {

                    // Run before each test
					cell = Bundle.main.loadNibNamed(ShopCell.identifier, owner: nil, options: nil)?.first! as! ShopCell
				}

                afterEach{

                     // Run after each test
                }

                // Puts test code here
				it("When instantiate", closure: {

					cell.awakeFromNib()
					expect(cell.photo.layer.cornerRadius).to(equal(15))
					expect(cell.photo.clipsToBounds).to(beTrue())
					expect(cell.photo.layer.borderWidth).to(equal(3.0))
					expect(cell.photo.layer.borderColor).to(equal(Colors.gray.value.cgColor))
				})

				it("When Set Cell", closure: {

					let expectButton = ShopButton(frame: CGRect.zero)
					expectButton.setLabel(icon: "cartplus", text: "Comprar", fontSize: 20.0)

					let vehicle = self.loadVehicle()
					cell.setupCell(vehicle: vehicle)

					expect(cell.identifier).to(equal(1))
					expect(cell.name.text).to(equal("Nissan GT-R"))
					expect(cell.price.text).to(equal("R$25.000,00"))
					expect(cell.button.titleLabel!.text).to(equal(expectButton.titleLabel!.text))
				})
            })
        }
	}

	func loadVehicle() -> Vehicle {

		let data = Stubs.loadFile(named: "mocklistcar")
		return Vehicle.newVehicles(with: data)![0]
	}
}
