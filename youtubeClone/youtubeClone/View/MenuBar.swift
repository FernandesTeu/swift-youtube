//
//  MenuBar.swift
//  youtubeClone
//
//  Created by Mateus Fernandes on 12/04/21.
//

import UIKit

class MenuBar: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
   
    private let cellId = "cellID"
    private let imagesName = ["home", "trending", "subscriptions", "account"]
    
    lazy var CollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.rgb(red: 230, green: 32, blue: 31)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //registra a celula que sera usada na collectionview
        //se não tiver uma celula personalizada, será passada UICollectionViewCell
        CollectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
        
        //adiciona a collectionview
        addSubview(CollectionView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: CollectionView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: CollectionView)
        let selectedIndexPath = NSIndexPath(item: 0, section: 0)
        CollectionView.selectItem(at: selectedIndexPath as IndexPath, animated: false, scrollPosition: .top)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
        
        //.withRenderingMode(.alwaysTemplate)
        //da um tom de dark na imagem que no original está com preencimento em branco
        
        cell.itemMenu.image = UIImage(named: imagesName[indexPath.item])?.withRenderingMode(.alwaysTemplate)
        cell.tintColor = UIColor.rgb(red: 91, green: 14, blue: 13)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 4, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

class MenuCell: BaseCell {
    
    let itemMenu: UIImageView = {
        let im = UIImageView()
        im.translatesAutoresizingMaskIntoConstraints = false
        im.image = UIImage(named: "casa")
        return im
    }()
    
    override func setUpViews() {
        super.setUpViews()
        addSubview(itemMenu)
        addConstraintsWithFormat(format: "H:[v0(28)]", views: itemMenu)
        addConstraintsWithFormat(format: "V:[v0(28)]", views: itemMenu)
        addConstraint(NSLayoutConstraint(item: itemMenu, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: itemMenu, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
    
    //metodo da propria UICollectionViewCell
    override var isHighlighted: Bool{
        didSet {
            itemMenu.tintColor = isHighlighted ? .white : UIColor.rgb(red: 91, green: 14, blue: 13)
        }
    }
    
    override var isSelected: Bool {
        didSet {
            itemMenu.tintColor = isSelected ? .white : UIColor.rgb(red: 91, green: 14, blue: 13)
        }
    }
}


