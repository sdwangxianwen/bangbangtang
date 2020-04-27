//
//  FYHomeSearchView.swift
//  bangbangtang
//
//  Created by wang on 2020/4/27.
//  Copyright © 2020 wang. All rights reserved.
//

import UIKit

class FYHomeSearchView: UIView {
    
    lazy var searchBtn : UIButton = UIButton.init(frame: CGRect(x: 15, y: 0, width: kScreenWidth - 130, height: 40))
    lazy var askBtn : UIButton = UIButton.init(frame: CGRect(x: self.searchBtn.maxX + 15, y: 0, width: 80, height: 40))

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI()  {
        searchBtn.setBackgroundImage(UIImage.init(named: "filter_segment_normal"), for: .normal)
        searchBtn.setImage(UIImage.init(named: "bbt_home_fake_seach_n"), for: .normal)
        searchBtn.setTitle("搜问题、动态、商品、用户", for: .normal)
        searchBtn.setTitleColor(UIColor.lightGray, for: .normal)
        searchBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(searchBtn)
        
        addSubview(askBtn)
        askBtn.backgroundColor = .yellow
        askBtn.setImage(UIImage.init(named: "bbt_home_ask_questions"), for: .normal)
        askBtn.setTitle("提问", for: .normal)
        askBtn.setTitleColor(.black, for: .normal)
        askBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        askBtn.layer.cornerRadius = 5
        askBtn.clipsToBounds = true
        
    }
    
}
