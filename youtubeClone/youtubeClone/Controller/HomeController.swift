//
//  ViewController.swift
//  youtubeClone
//
//  Created by Mateus Fernandes Pinto on 06/04/21.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    //MARK:- VARIAVEIS E INICIALIZADORES
    let cellID: String =  "cellID"
    
    var videos: [Video] = {
        
        var channelTylor = Channel()
        channelTylor.channelName = "Taylor Swift Offical Channel"
        channelTylor.profileImageName = "taylor_swift_profile"
        
        var blankSpaceVideo = Video()
        blankSpaceVideo.title = "Tylor Swift - Blank Space"
        blankSpaceVideo.thumbnailImageName = "taylor_swift_blank_space"
        blankSpaceVideo.channel = channelTylor
        blankSpaceVideo.numberOfViews = 23423423
        
        var fearless = Video()
        fearless.title = "Tylor Swift - Fearless"
        fearless.thumbnailImageName = "taylor_swift_fearless"
        fearless.channel = channelTylor
        fearless.numberOfViews = 234111231234 
        
        return [blankSpaceVideo, fearless]
    }()
    
    let menuBar: MenuBar = {
        let mb = MenuBar()
        mb.translatesAutoresizingMaskIntoConstraints = false
        return mb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.backgroundColor = .white
        //registrando a classe que será utlizada para celula na collectionview
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: cellID)
        
        //distanciando a collectionview do menuBarView
        collectionView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        //faz o scroll acompanhar a celula da collectionview
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        
        navigationController?.navigationBar.isTranslucent =  false
        setUpTitleNavigationBar()
        setUpMenuBar()
        setUpNavBarButtons()
    }
    
    
    
    //MARK: - SETUPS
    
    func setUpNavBarButtons() {
        let searchImage = UIImage(named: "search_icon")?.withRenderingMode(.alwaysOriginal)
        let searchBarButtonIcon = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleSearch))
        
        let moreImage = UIImage(named: "nav_more_icon")?.withRenderingMode(.alwaysOriginal)
        let moreBarButtonIcon = UIBarButtonItem(image: moreImage, style: .plain, target: self, action: #selector(handleMoreButton))
        
        navigationItem.rightBarButtonItems = [moreBarButtonIcon, searchBarButtonIcon]
    }
    
    func setUpMenuBar() {
        view.addSubview(menuBar)
        menuBar.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        menuBar.addConstraintsWithFormat(format: "V:|[v0(50)]", views: menuBar)
    }
    
    func setUpTitleNavigationBar() {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        titleLabel.text = "Home"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize:20)
        
        navigationItem.titleView = titleLabel
        
    }
    
    //MARK: - Metodos dos Botões na NavigationBar
    @objc func handleSearch() {
        print("Search")
    }
    
    @objc func handleMoreButton() {
        print("More button")
    }
    
    
   //MARK: - Funções da CollectionView
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! VideoCell
        cell.video = videos[indexPath.item]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height = (view.frame.width - 32) * 9 / 16
        return CGSize(width: view.frame.width, height:height + 16 + 68)
    }
    
}

