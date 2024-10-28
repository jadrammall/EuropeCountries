//
//  CountryListCollectionViewCell.swift
//  EuropeCountries
//
//  Created by Jad Rammal on 28/10/2024.
//

import UIKit
import SDWebImage

class CountryListCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var countryFlagImage: UIImageView!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var countryCapitalLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup (country: CountryResult) {
        countryNameLabel.text = country.name.common
        countryCapitalLabel.text = country.capital.first
        if let url = URL(string: country.flags.png) {
            countryFlagImage.sd_setImage(with: url)
        }
    }

}
