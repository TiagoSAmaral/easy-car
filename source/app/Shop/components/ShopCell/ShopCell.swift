//
//  ShopCell.swift
//  easycar
//
//  Created by Tiago da Silva Amaral on 21/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import UIKit
import Kingfisher
import SwiftIconFont

class ShopCell: UITableViewCell {

	@IBOutlet var photo: UIImageView!
	@IBOutlet var name: UILabel!
	@IBOutlet var price: UILabel!
	@IBOutlet var button: ShopButton!

	let defaultImage: UIImage = UIImage(named: "placeholder")!
	weak var delegate: ShopInterface!
	var identifier: Int!

    override func awakeFromNib() {
        super.awakeFromNib()
		self.setApperancePhoto()
    }

	func willBeRecycled () {
		self.photo.kf.cancelDownloadTask()
	}

	func setupCell(vehicle: Vehicle) {
		self.identifier = vehicle.identifier
		self.photo.kf.setImage(with: URL(string: vehicle.image)!, placeholder: defaultImage)
		self.name.text = vehicle.name
		self.price.text = vehicle.price.currency(in: .brazil)
		self.button.setLabel(icon: "cartplus", text: "Comprar", fontSize: 20.0)
		self.button.addTarget(self, action: #selector(addItem), for: .touchUpInside)
	}

	@objc func addItem(){
		self.delegate!.addNewCarTorOrder(at: self.identifier)
	}

	func setApperancePhoto() {

		self.photo.layer.cornerRadius = 15
		self.photo.clipsToBounds = true

		self.photo.layer.borderWidth = 3.0
		self.photo.layer.borderColor = Colors.gray.value.cgColor
	}
}
