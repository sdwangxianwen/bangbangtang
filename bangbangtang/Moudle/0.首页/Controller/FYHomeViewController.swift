//
//  FYHomeViewController.swift
//  bangbangtang
//
//  Created by wang on 2020/4/26.
//  Copyright © 2020 wang. All rights reserved.
//

import UIKit
import JXPagingView



class FYHomeViewController: FYPageBaseViewController {
    
    var homeDataModel : dataModel!
    lazy var serachView : FYHomeSearchView = FYHomeSearchView.init()
    lazy var userHeaderView: FYHomeHeaderView = preferredTableHeaderView() //顶部的header
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        serachView.backgroundColor = UIColor.white
        serachView.frame = CGRect(x: 0, y: kStatusBarHeight, width: kScreenWidth, height: kNavBarHeight - kStatusBarHeight)
        self.view.addSubview(serachView)
        serachView.searchBtn.setBackgroundImage(UIImage.init(named: "filter_segment_disable"), for: .normal)
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
            self.userHeaderView.reloadBanner(bannerArr: self.homeDataModel.headerItem.bannerList)
        }
        
    }
    func mainTableViewDidScroll(_ scrollView: UIScrollView) {
        let thresholdDistance: CGFloat = kNavBarHeight
        let percent = scrollView.contentOffset.y/thresholdDistance
        serachView.isHidden = percent < 1
        userHeaderView.searchView.isHidden = percent >= 1
    }
    
     func preferredTableHeaderView() -> FYHomeHeaderView {
        let view = FYHomeHeaderView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 500))
        view.backgroundColor = .lightGray
        return view
    }
    
    override func tableHeaderView(in pagingView: JXPagingView) -> UIView {
        return userHeaderView
    }
    override func tableHeaderViewHeight(in pagingView: JXPagingView) -> Int {
           return 500
       }
    
}






