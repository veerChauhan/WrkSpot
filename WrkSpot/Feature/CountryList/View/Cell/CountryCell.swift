//
//  CountryCell.swift
//  WrkSpot
//
//  Created by Ravi Ranjan on 09/02/24.
//

import UIKit

class CountryCell: UITableViewCell {

    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var PopulationLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    
    
    @IBOutlet weak var countryCellContainer: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
