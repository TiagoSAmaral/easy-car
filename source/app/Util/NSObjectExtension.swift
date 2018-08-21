//
//  NSObjectExtension.swift
//  easycar
//
//  Created by Tiago da Silva Amaral on 21/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import Foundation

protocol Identifying{}

extension Identifying where Self: NSObject{

	static var identifier: String { return String(describing: self) }
}

extension NSObject: Identifying {}
