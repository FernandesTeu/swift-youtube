//
//  CardViewController.swift
//  TinderCloneEstudo
//
//  Created by Mateus Fernandes Pinto on 11/06/21.
//

import UIKit

class CardView: UIView {

    var usuarioTinder: Tinders? {
        didSet {
            if let userTinder = usuarioTinder {
                profilePhoto.image = UIImage(named: userTinder.foto)
                nomeLabel.text = userTinder.nome
                idadeLabel.text = String(userTinder.idade)
                fraseLabel.text = userTinder.frase
            }
        }
    }
    
    
    let profilePhoto: UIImageView = .fotoImageView()
    
    lazy var nomeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.sizeToFit()
        label.font = UIFont.preferredFont(forTextStyle: .body, compatibleWith: UITraitCollection(legibilityWeight: .bold))
        label.font = UIFont.systemFont(ofSize: 32)
        return label
    }()
    
    lazy var idadeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 32)
        label.textColor = .white
        label.sizeToFit()
        label.font = UIFont.preferredFont(forTextStyle: .body, compatibleWith: UITraitCollection(legibilityWeight: .bold))
        return label
    }()
    
    lazy var fraseLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .white
        label.sizeToFit()
        return label
    }()
    
    var deslikeImageView: UIImageView = .iconCard(named: "card-deslike")
    var likeImageView: UIImageView = .iconCard(named: "card-like")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.borderWidth = 0.3
        layer.borderColor = UIColor.lightGray.cgColor
        layer.cornerRadius = 8
        clipsToBounds = true
        
        addSubview(profilePhoto)
        addSubview(deslikeImageView)
        deslikeImageView.preencher(top: topAnchor, leading: nil, trailing: trailingAnchor, bottom: nil, padding: .init(top: 20, left: 0, bottom: 0, right: 20))
       
        addSubview(likeImageView)
        likeImageView.preencher(top: topAnchor, leading: leadingAnchor, trailing: nil, bottom: nil, padding: .init(top: 20, left: 20, bottom: 0, right: 0))
        
        let nomeIdadeStackView = UIStackView(arrangedSubviews: [nomeLabel, idadeLabel, UIView()])
        nomeIdadeStackView.spacing = 12
        
        let fraseStackView = UIStackView(arrangedSubviews: [nomeIdadeStackView, fraseLabel])
        fraseStackView.axis = .vertical
        fraseStackView.distribution = .fillEqually
        
        
        addSubview(fraseStackView)
        nomeLabel.shadonw()
        idadeLabel.shadonw()
        
        fraseStackView.preencher(top: nil, leading: leadingAnchor, trailing: trailingAnchor, bottom: bottomAnchor, padding: .init(top: 0, left: 16, bottom: 16, right: 16))
        
        profilePhoto.preencherSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension UIView {
    func shadonw() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.8
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.masksToBounds = false
    }
}

extension UIImageView {
    static func fotoImageView(named: String? = nil) -> UIImageView {
        let imageView = UIImageView()
        if let named = named {
            imageView.image = UIImage(named: named)
        }
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }
    
    static func iconCard(named: String) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: named)
        imageView.size(size: .init(width: 70, height: 70))
        imageView.alpha = 0.0
        return imageView
    }
}
