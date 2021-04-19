//
//  SettingCell.swift
//  youtubeClone
//
//  Created by Mateus Fernandes Pinto on 19/04/21.
//

import UIKit

class SettingCell: BaseCell {
    
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Setting"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let iconView: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.image = UIImage(named: "settings")
        icon.contentMode = .scaleAspectFill
        
        return icon
    }()
    
    
    override func setUpViews() {
        super.setUpViews()
        
        addSubview(nameLabel)
        addSubview(iconView)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: nameLabel)
        addConstraintsWithFormat(format: "V:|[v0]|", views: nameLabel)
        
    }
}
