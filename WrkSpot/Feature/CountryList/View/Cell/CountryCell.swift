//
//  CountryCell.swift
//  WrkSpot
//
//  Created by Ravi Ranjan on 09/02/24.
//

import UIKit



class CountryCell: UITableViewCell {

    @IBOutlet weak var countryImageView: UIImageView!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var PopulationLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    
    @IBOutlet weak var countryNameLabel: UILabel!
    
    @IBOutlet weak var countryCellContainer: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization codes
        self.countryCellContainer.layer.cornerRadius = 5
    }

    override func prepareForReuse() {
        // Removing image to avoid overalpping of image
        self.countryImageView.image = UIImage(named: "")
    }
    func configureCoutry(with countryDetail: CountryDetailModel) {
        self.countryNameLabel.text = countryDetail.name ?? ""
        self.capitalLabel.text = "Capital: \(countryDetail.capital ?? "")"
        self.PopulationLabel.text = "Population: \(countryDetail.population ?? 0)"
        self.currencyLabel.text = "Currency: \(countryDetail.currency ?? "")"
        guard let flag = countryDetail.media?.flag else {return}
        self.countryImageView.loadRemoteImage(from: flag)

    }
    
}
