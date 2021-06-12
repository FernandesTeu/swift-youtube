//
//  CardViewController.swift
//  TinderCloneEstudo
//
//  Created by Mateus Fernandes Pinto on 11/06/21.
//

import UIKit

class CardView: UIView {

    lazy var profilePhoto: UIImageView = {
        let profile = UIImageView()
        profile.image = UIImage(named: "pessoa-4")
        profile.clipsToBounds = true
        profile.contentMode = .scaleAspectFill
        profile.translatesAutoresizingMaskIntoConstraints = false
        return profile
    }()
    
    lazy var nomeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.sizeToFit()
        label.font = UIFont.preferredFont(forTextStyle: .body, compatibleWith: UITraitCollection(legibilityWeight: .bold))
        label.text = "Alana"
        return label
    }()
    
    lazy var idadeLabel: UILabel = {
        let label = UILabel()
        label.text = "19 Anos"
        label.textColor = .white
        label.sizeToFit()
        label.font = UIFont.preferredFont(forTextStyle: .body, compatibleWith: UITraitCollection(legibilityWeight: .bold))
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.borderWidth = 0.3
        layer.borderColor = UIColor.lightGray.cgColor
        layer.cornerRadius = 8
        clipsToBounds = true
        addSubview(profilePhoto)
        
        let stackView = UIStackView(arrangedSubviews: [nomeLabel, idadeLabel])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 4
        addSubview(stackView)
        
        stackView.preencher(top: nil, leading: leadingAnchor, trailing: trailingAnchor, bottom: bottomAnchor, padding: .init(top: 0, left: 16, bottom: 16, right: 16))
        
        profilePhoto.preencherSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
