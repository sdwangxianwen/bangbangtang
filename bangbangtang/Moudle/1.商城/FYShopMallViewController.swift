//
//  FYShopMallViewController.swift
//  bangbangtang
//
//  Created by wang on 2020/4/26.
//  Copyright © 2020 wang. All rights reserved.
//

import UIKit

class FYShopMallViewController: FYBaseViewController {
    
    lazy var goodsArr = NSMutableArray.init()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        view.addSubview(goodsCollectionView)

        FYNetManager.shared.post(target: .shopList) { (response) in
            
        }
    }
    
    
    
    lazy var goodsCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: kScreenWidth/2 - 5, height: 220)
        let goodsCollectionView = UICollectionView.init(frame: CGRect(x: 0, y: kNavBarHeight, width: kScreenWidth, height: kScreenHeight - kNavBarHeight - kTabBarHeight), collectionViewLayout: layout)
        goodsCollectionView.delegate = self
        goodsCollectionView.dataSource = self
        goodsCollectionView.register(FYShopNormalCollectionViewCell.self, forCellWithReuseIdentifier: "FYShopNormalCollectionViewCellID")
        goodsCollectionView.backgroundColor = UIColor.lightGray
        goodsCollectionView.contentInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        return goodsCollectionView
    }()
}

extension FYShopMallViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : FYShopNormalCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FYShopNormalCollectionViewCellID", for: indexPath) as! FYShopNormalCollectionViewCell
        return cell
        
    }
    
    
}
