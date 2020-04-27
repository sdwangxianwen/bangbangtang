//
//  FYShopNormalCollectionViewCell.swift
//  bangbangtang
//
//  Created by wang on 2020/4/27.
//  Copyright © 2020 wang. All rights reserved.
//

import UIKit

class FYShopNormalCollectionViewCell: UICollectionViewCell {
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var bgView : UIView = UIView.init()
    lazy var icon : UIImageView = UIImageView.init()
    
    func setupUI() {
        self.contentView.addSubview(bgView)
        bgView.backgroundColor = .white
        bgView.layer.cornerRadius = 10
        bgView.clipsToBounds = true
        bgView.snp.makeConstraints { (make) in
            make.top.left.equalTo(self).offset(5)
            make.right.bottom.equalTo(self).offset((-5))
        }
        
        self.contentView.addSubview(icon)
        icon.snp.makeConstraints { (make) in
            make.top.left.equalTo(self)
            make.right.equalTo(self)
            make.height.equalTo(120)
        }
        
        
    }
}


