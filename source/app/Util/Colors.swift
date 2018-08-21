//
//  Colors.swift
//  easycar
//
//  Created by Tiago da Silva Amaral on 20/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import UIKit

enum Colors {
	case primary
	case secondary
	case text
	case gray

	var value: UIColor {

		switch self {
		case .primary:
			return UIColor(red: 255.0/255.0, green: 201.0/255.0, blue: 0/255.0, alpha: 1.0)
		case .secondary:
			return UIColor(red: 181.0/255.0, green: 181.0/255.0, blue: 181.0/255.0, alpha: 1.0)
		case .text:
			return .black
		case .gray:
			return UIColor(red: 226.0/255.0, green: 226.0/255.0, blue: 226.0/255.0, alpha: 1.0)
		}
	}
}
