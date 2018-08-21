//
//  UtilTests.swift
//  easycar
//
//  Created by Tiago da Silva Amaral on 20/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import Quick
import Nimble
import SwiftIconFont

@testable import easycar

class UtilTests: QuickSpec {

	override func spec() {
		
        describe("Testing Util Class and Extensions") {

			context("Test String Extension", closure: {

				it("Give a Float and get back a currency value PT_BR", closure: {

					let floatValue: Float = 25.32
					let currencyValue = floatValue.currency(in: .brazil)
					expect(currencyValue).to(equal("R$25,32"))
				})

				it("Give a Float and get back a currency value EN_US", closure: {

					let floatValue: Float = 25.32
					let currencyValue = floatValue.currency(in: .unitstate)
					expect(currencyValue).to(equal("$25.32"))
				})
            })

			context("Testing UIViewController Extension", closure: {

				it("Create a custom UIBarButtonItem", closure: {

					let icon: String = "close"
					let textTest: String = "textTest"
					let widthExpected: CGFloat = 28.0

					let button: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: widthExpected, height: 28))
					button.titleLabel!.font = UIFont.icon(from: .fontAwesome, ofSize: 28)
					button.titleLabel!.text = String.fontAwesomeIcon(icon)
					button.titleLabel!.text!.append(" ")
					button.titleLabel!.text!.append(textTest)
					button.parseIcon()

					let viewController: UIViewController = UIViewController()
					let barButton = viewController.createButtonNavigationItem(target: viewController, selector: #selector(self.testMethod), icon: icon, text: textTest, width: Int(widthExpected))
					let buttonBar = barButton.customView as! UIButton

					expect(buttonBar.titleLabel!.text).to(equal(button.titleLabel!.text))
					expect(buttonBar.frame.size.width).to(equal(button.frame.size.width))
					expect(buttonBar.allTargets.count).to(beGreaterThan(0))
				})
			})

			context("Testing ShopButton (Subclass UIButton) ", closure: {

				it("Test Apperance after Instantiate", closure: {

					let button: ShopButton = ShopButton()
					button.awakeFromNib()

					expect(button.backgroundColor).to(equal(Colors.primary.value))
					expect(button.layer.cornerRadius).to(equal(10.0))
				})

				it("Set label text and icon", closure: {

					let icon: String = "close"
					let textTest: String = "textTest"

					let buttoExpect: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 28, height: 28))
					buttoExpect.titleLabel!.font = UIFont.icon(from: .fontAwesome, ofSize: 28)
					buttoExpect.titleLabel!.text = String.fontAwesomeIcon(icon)
					buttoExpect.titleLabel!.text!.append(" ")
					buttoExpect.titleLabel!.text!.append(textTest)
					buttoExpect.parseIcon()

					let button: ShopButton = ShopButton()
					button.setLabel(icon: icon, text: textTest, fontSize: 20.0)
					expect(button.titleLabel!.text).to(equal(buttoExpect.titleLabel!.text))
				})
			})

			context("Testing Colors", closure: {

				it("Get Primary Color", closure: {
					let expected: UIColor = UIColor(red: 255.0/255.0, green: 201.0/255.0, blue: 0/255.0, alpha: 1.0)
					expect(Colors.primary.value).to(equal(expected))
				})

				it("Get Secondary Color", closure: {
					let expected: UIColor = UIColor(red: 181.0/255.0, green: 181.0/255.0, blue: 181.0/255.0, alpha: 1.0)
					expect(Colors.secondary.value).to(equal(expected))
				})

				it("Get Text Color", closure: {
					expect(Colors.text.value).to(equal(UIColor.black))
				})
//
				it("Get Gray Color", closure: {
					let expected: UIColor = UIColor(red: 226.0/255.0, green: 226.0/255.0, blue: 226.0/255.0, alpha: 1.0)
					expect(Colors.gray.value).to(equal(expected))
				})
			})

			context("NSObject Extension", closure: {
				it("Parse name class to string", closure: {
					expect(NSObject.identifier).to(equal("NSObject"))
				})
			})

			context("Detect Debug Enviroment", closure: {
				it("Check enviroment Debug", closure: {
					let enviroment = Environment()
					expect(enviroment.current).to(equal(EnvironmentFlag.debug))
				})
			})
        }
	}

	func testMethod() {}
}
