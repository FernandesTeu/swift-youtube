//
//  ViewController.swift
//  youtubeClone
//
//  Created by Mateus Fernandes Pinto on 06/04/21.
//

import UIKit

class HomeController: UICollectionViewController {
    let cellID: String =  "cellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title = "Home"
        collectionView.backgroundColor = .white
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: cellID)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        
        return cell
    }
    
}

extension HomeController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
}

//Classe que representa o layout de cada celula da UICollectionView
class VideoCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    //imagem maior
    let thumbnailImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = .systemBlue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //Configuração das celulas da UICollectionViewCell
    func setupViews() {
        addSubview(thumbnailImageView)
        thumbnailImageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-16-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: ["v0": thumbnailImageView])
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-16-[v0]-16-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil , views: ["v0": thumbnailImageView])
        NSLayoutConstraint.activate(horizontalConstraints)
        NSLayoutConstraint.activate(verticalConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
