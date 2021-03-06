//
//  VideoCell.swift
//  youtubeClone
//
//  Created by Mateus Fernandes on 12/04/21.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    func setUpViews() {}
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//Classe que representa o layout de cada celula da UICollectionView
class VideoCell: BaseCell {
    
    var video: Video? {
        didSet {
            
            titleLabel.text = video?.title
            setupThumbnailImage()
            setupThumbnailUserProfile()
            
            if let profileImageName = video?.channel?.profileImageName {
                userProfileImageView.image = UIImage(named: profileImageName )
            }
            
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            
            if let channelName = video?.channel?.channelName, let numberOfViews = video?.numberOfViews {
                if let numberFormaterFrom = numberFormatter.string(from: numberOfViews) {
                    subtitleTextView.text = "\(channelName) * \(numberFormaterFrom) * 2 years ago"
                }
                
            }
        }
    }

    
    //imagem maior
    let thumbnailImageView: CustomImageView = {
       let imageView = CustomImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let userProfileImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 233/255, green: 230/255, blue: 230/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subtitleTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textContainerInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
        textView.textColor = .lightGray
        return textView
    }()
    
    //Configura????o das celulas da UICollectionViewCell
    override func setUpViews() {
        addSubview(thumbnailImageView)
        addSubview(separatorView)
        addSubview(userProfileImageView)
        addSubview(titleLabel)
        addSubview(subtitleTextView)
        
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: thumbnailImageView)
        addConstraintsWithFormat(format: "H:|-16-[v0(44)]", views: userProfileImageView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: separatorView)
        
        //vertical constraints
       addConstraintsWithFormat(format: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: thumbnailImageView, userProfileImageView,separatorView)
        
        //top constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 8))
        //left constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        //right constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        //height
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
        //top constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 5))
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30))
        
    }
    
    //MARK: - FUNCTIONS
    func setupThumbnailUserProfile() {
        if let thumnailUserImageUrl = video?.channel?.profileImageName {
            userProfileImageView.loadImageUsingUrlString(urlString: thumnailUserImageUrl)
        }
    }
    
    func setupThumbnailImage() {
        if let thumnailImageUrl = video?.thumbnailImageName {
            thumbnailImageView.loadImageUsingUrlString(urlString: thumnailImageUrl)
        }
    }

}

