//
//  FYHomeViewController.swift
//  bangbangtang
//
//  Created by wang on 2020/4/26.
//  Copyright © 2020 wang. All rights reserved.
//

import UIKit




class FYHomeViewController: FYPageBaseViewController {
    
    var homeDataModel : dataModel!
    lazy var serachView : UIView = UIView.init()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        serachView.backgroundColor = UIColor.purple
        serachView.frame = CGRect(x: 0, y: kStatusBarHeight, width: kScreenWidth, height: kNavBarHeight - kStatusBarHeight)
        self.view.addSubview(serachView)
        serachView.isHidden = true
 
        FYNetManager.shared.post(target: .feedList) { (response) in
            
            self.homeDataModel = try! JSONDecoder().decode(dataModel.self, from: response as! Data)
            let arrm = NSMutableArray.init()
            
            for titles : customTabListModel  in self.homeDataModel.customTabList {
                arrm.add(titles.tabName)
            }
            
            self.dataSource.titles = arrm.copy() as! [String]
            self.dataSource.reloadData(selectedIndex: 0)
            self.segmentedView.defaultSelectedIndex = 0
            self.segmentedView.reloadData()
        }
        
    }
    func mainTableViewDidScroll(_ scrollView: UIScrollView) {
        let thresholdDistance: CGFloat = kStatusBarHeight
        let percent = scrollView.contentOffset.y/thresholdDistance
        serachView.isHidden = percent < 1
    }
    
   
}






