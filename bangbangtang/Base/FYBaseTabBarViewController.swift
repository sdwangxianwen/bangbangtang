//
//  FYBaseTabBarViewController.swift
//  bangbangtang
//
//  Created by wang on 2020/4/26.
//  Copyright © 2020 wang. All rights reserved.
//

import UIKit

class FYBaseTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupChild()
    }
    
    func setupChild() {
        let homeVC = FYHomeViewController.init()
        let shaopVC = FYShopMallViewController.init()
        let searchVC = FYSearchGoodingViewController.init()
        let meVC = FYMeViewController.init()
        
        addChild(homeVC, title: "", imageName:"homeIcon_toolBar_normal", imageSelectName: "homeIcon_toolBar_action")
        addChild(shaopVC, title: "", imageName: "market_toolBar_normal", imageSelectName: "market_toolBar_action")
        addChild(searchVC, title: "", imageName: "category", imageSelectName: "category_s")
        addChild(meVC, title: "", imageName: "profile_toolBar_normal", imageSelectName: "profile_toolBar_action")
        
    }
    
   
    
    func addChild(_ childController: UIViewController,title:String,imageName:String,imageSelectName:String) {
        
        childController.tabBarItem = UITabBarItem.init(title: title, image:UIImage.init(named: imageName)!.withRenderingMode(.alwaysOriginal), selectedImage: UIImage.init(named: imageSelectName)?.withRenderingMode(.alwaysOriginal))
        childController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.lightGray], for: .normal)
        childController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.blue], for: .selected)
        let nav = FYNavgationController.init(rootViewController:childController)
        
        addChild(nav)
    }

  
}
