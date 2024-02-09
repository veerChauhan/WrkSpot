//
//  UIimageView+Extension.swift
//  WrkSpot
//
//  Created by Ravi Ranjan on 09/02/24.
//

import Foundation
import UIKit
import UIKit

extension UIImageView {
    private static let imageCache = NSCache<AnyObject, AnyObject>()

    func loadRemoteImage(from urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }

        if let imageFromCache = UIImageView.imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }

        let activityView = UIActivityIndicatorView(style: .medium)
        activityView.center = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
        activityView.startAnimating()
        self.addSubview(activityView)

        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            DispatchQueue.main.async {
                activityView.stopAnimating()
                activityView.removeFromSuperview()
            }

            if let error = error {
                print("Error loading image: \(error)")
                return
            }

            guard let data = data, let image = UIImage(data: data) else {
                print("Invalid image data")
                return
            }

            UIImageView.imageCache.setObject(image, forKey: urlString as AnyObject)

            DispatchQueue.main.async {
                self?.image = image
            }
        }.resume()
    }
}
