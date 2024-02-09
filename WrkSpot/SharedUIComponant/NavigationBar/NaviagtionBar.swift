//
//  NaviagtionBar.swift
//  Wrkspot
//
//  Created by Ravi Ranjan on 09/02/24.
//

import UIKit

class NaviagtionBar: UIView {
    
    @IBOutlet weak var todayDateAndTimelabel: UILabel!
    
    @IBOutlet weak var profileContainerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
  
    
    private var timer: Timer?
        
        func customizeProfileContainer(cornerRadiusOption: CornerRadius) {
            switch cornerRadiusOption {
            case .round:
                profileContainerView.layer.cornerRadius = profileContainerView.bounds.height / 2
            case .custom(let value):
                profileContainerView.layer.cornerRadius = value
            }
            profileContainerView.layer.masksToBounds = true
        }
        
        func startUpdatingDateAndTime() {
            updateTodayDateAndTime()
            
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
                self?.updateTodayDateAndTime()
            }
        }
        
        private func updateTodayDateAndTime() {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            todayDateAndTimelabel.text = dateFormatter.string(from: Date())
        }
        
        deinit {
            timer?.invalidate()
        }
    }
