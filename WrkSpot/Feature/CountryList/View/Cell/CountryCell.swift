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
        // Initialization code
    }

    
    func configureCoutry(with countryDetail: CountryDetailModel) {
        self.countryNameLabel.text = countryDetail.name ?? ""
        self.capitalLabel.text = countryDetail.capital ?? ""
        self.PopulationLabel.text = "\(countryDetail.population ?? 0)"
        self.currencyLabel.text = countryDetail.currency
    }
    
}
