//
//  NaviagtionBar.swift
//  Wrkspot
//
//  Created by Ravi Ranjan on 09/02/24.
//

import UIKit

class NaviagtionBar: UIView {
    
    @IBOutlet weak var naviagtionBarContainerView: UIView!
    @IBOutlet weak var todayDateAndTimelabel: UILabel!
    @IBOutlet weak var profileContainerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    //120 40 200
    private var timer: Timer?
    
    override init(frame: CGRect) {
         super.init(frame: frame)
         commonInit()
     }
     
     required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
         commonInit()
     }
     
     private func commonInit() {
         let nib = UINib(nibName: "NaviagtionBar", bundle: nil)
         if let contentView = nib.instantiate(withOwner: self, options: nil).first as? UIView {
             addSubview(contentView)
             contentView.frame = bounds
             contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
             self.naviagtionBarContainerView.layer.borderWidth = 2
             self.naviagtionBarContainerView.layer.borderColor = UIColor(
                 red: 120/255.0,
                 green: 40/255.0,
                 blue: 200/255.0,
                 alpha: 1.0
             ).cgColor
         }
     }
    
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
    
    func invaildateTimer() {
        self.timer?.invalidate()
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
