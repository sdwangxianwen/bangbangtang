//
//  FYHomeHeaderView.swift
//  bangbangtang
//
//  Created by wang on 2020/4/27.
//  Copyright © 2020 wang. All rights reserved.
//

import UIKit
import JXBanner
import SnapKit
import Kingfisher

class FYHomeHeaderView: UIView {
    
    lazy var bannerArr : [bannerListModel] = NSArray.init() as! [bannerListModel]
    lazy var searchView = FYHomeSearchView.init(frame: CGRect(x: 0, y: kNavBarHeight, width: kScreenWidth, height: 64))
    lazy var userIcon : UIImageView = UIImageView.init(frame: CGRect(x: 15, y:12 , width: 40, height: 40))
    lazy var userName : UILabel = UILabel.init()
//    lazy var ageLabel : UILabel = UILabel.init()
    
    lazy var banner: JXBanner = {
           let banner = JXBanner()
           banner.backgroundColor = UIColor.lightGray
           banner.placeholderImgView.image = UIImage(named: "banner_placeholder")
           banner.delegate = self
           banner.dataSource = self
    
           return banner
       }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(banner)
        searchView.backgroundColor = .lightGray
        addSubview(self.searchView)
        addSubview(userIcon)
        userIcon.image = UIImage.init(named: "def_avatar")
        addSubview(userName)
        userName.text = "小糖豆azdy63"
        userName.textColor = .black
        userName.font = UIFont.systemFont(ofSize: 17)
        userName.snp.makeConstraints { (make) in
            make.top.equalTo(userIcon)
            make.left.equalTo(userIcon.snp_right).offset(10)
        }
        
        banner.snp.makeConstraints { (maker) in
            maker.left.right.equalTo(self)
            maker.height.equalTo(250)
            maker.top.equalTo(self.snp_top).offset(kNavBarHeight + 44)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func reloadBanner(bannerArr : [bannerListModel]) {
        self.bannerArr = bannerArr
        banner.reloadView()
    }
    
}



extension FYHomeHeaderView : JXBannerDelegate,JXBannerDataSource {
    func jxBanner(_ banner: JXBannerType, cellForItemAt index: Int, cell: UICollectionViewCell) -> UICollectionViewCell {
        let bannerModel : bannerListModel = bannerArr[index]
        
        let tempCell: JXBannerCell = cell as! JXBannerCell
        tempCell.layer.cornerRadius = 8
        tempCell.layer.masksToBounds = true
        tempCell.imageView.kf.setImage(with: URL(string: bannerModel.picUrl))
//        tempCell.imageView.image = UIImage(named: "banner_placeholder")
        tempCell.msgLabel.backgroundColor = .clear
        return tempCell
    }
    
    func jxBanner(_ banner: JXBannerType)
        -> (JXBannerCellRegister) {
            return JXBannerCellRegister(type: JXBannerCell.self,
                                        reuseIdentifier: "JXDefaultVCCell")
    }
    
    func jxBanner(numberOfItems banner: JXBannerType)
        -> Int { return bannerArr.count }
    
   
    
    func jxBanner(_ banner: JXBannerType,
                  layoutParams: JXBannerLayoutParams)
        -> JXBannerLayoutParams {
        return layoutParams
            .itemSize(CGSize(width: UIScreen.main.bounds.width - 40, height: 200))
            .itemSpacing(20)
    }
    
    public func jxBanner(_ banner: JXBannerType,
                            didSelectItemAt index: Int) {
           print(index)
       }
}
