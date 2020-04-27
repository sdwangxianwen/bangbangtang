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
    
    
    lazy var banner: JXBanner = {
           let banner = JXBanner()
           banner.backgroundColor = UIColor.white
           banner.placeholderImgView.image = UIImage(named: "banner_placeholder")
           banner.delegate = self
           banner.dataSource = self
           return banner
       }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(banner)
        banner.snp.makeConstraints { (maker) in
            maker.left.right.equalTo(self)
            maker.height.equalTo(250)
            maker.top.equalTo(self.snp_top).offset(kNavBarHeight + 30)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubview(banner)
       
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
        tempCell.msgLabel.text = bannerModel.uri
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
