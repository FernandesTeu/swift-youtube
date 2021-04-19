//
//  Utils.swift
//  youtubeClone
//
//  Created by Mateus Fernandes on 12/04/21.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
        }
        
        let constraintsBuilder = NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil , views: viewsDictionary)
        NSLayoutConstraint.activate(constraintsBuilder)
    }
}

let imageCache = NSCache<AnyObject, AnyObject>()


class CustomImageView: UIImageView {
    
    var imageUrlString: String?
    
    func loadImageUsingUrlString(urlString: String) {
        
        let url = URL(string: urlString)
        let session = URLSession(configuration: .default)
        imageUrlString = urlString
        
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject ) as? UIImage {
            DispatchQueue.main.async {
                self.image = imageFromCache
                return
            }
        }
        
        let task = session.dataTask(with: url!) { (data, response, error) in
           if error != nil{
                print(error!)
                return
            }

            DispatchQueue.main.async {
                let imageToCache = UIImage(data: data!)
                if self.imageUrlString == urlString {
                    self.image = imageToCache
                }
                imageCache.setObject(imageToCache!, forKey: urlString as AnyObject )
            }
        }

        task.resume()
    }
}
