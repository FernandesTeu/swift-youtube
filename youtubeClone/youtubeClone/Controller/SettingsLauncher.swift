//
//  SettingsLauncher.swift
//  youtubeClone
//
//  Created by Mateus Fernandes Pinto on 19/04/21.
//

import UIKit

class SettingsLauncher: NSObject, UICollectionViewDelegateFlowLayout {
   
    let blackView = UIView()
    let cellId = "cellid"
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
    
    func showSettings() {
        if let keyWindow = UIWindow.key {
            blackView.backgroundColor = UIColor(cgColor: CGColor(red: 0, green: 0, blue: 0, alpha: 0.5))
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            keyWindow.addSubview(self.blackView)
            keyWindow.addSubview(collectionView)
            
            let height: CGFloat = 200
            let y = keyWindow.frame.height - height
            
            collectionView.frame = CGRect(x: 0, y: keyWindow.frame.height, width: keyWindow.frame.width, height: height)
            blackView.frame = keyWindow.frame
            blackView.alpha = 0
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.blackView.alpha = 1
                self.collectionView.frame = CGRect(x: 0, y: y, width: keyWindow.frame.width, height: keyWindow.frame.height)
            }, completion: nil)
            
        }
    }
    
    @objc func handleDismiss() {
        print("handle")
        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 0
            
            if let keyWindow = UIWindow.key {
                self.collectionView.frame = CGRect(x: 0, y: keyWindow.frame.height, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
            }
        }
    }
    
    override init() {
        super.init()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(SettingCell.self, forCellWithReuseIdentifier: cellId)
       
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }

}


extension SettingsLauncher: UICollectionViewDelegate {
    
    
}

extension SettingsLauncher: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        return cell
    }
    
}

