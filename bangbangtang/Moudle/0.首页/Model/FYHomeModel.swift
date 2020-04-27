//
//  FYHomeModel.swift
//  bangbangtang
//
//  Created by wang on 2020/4/26.
//  Copyright © 2020 wang. All rights reserved.
//

import UIKit

typealias Codable = Decodable & Encodable



struct dataModel : Codable {
    
    let customTabList : [customTabListModel]
    let feedList : [feedListModel]
    
    
}

struct customTabListModel : Codable {
    var tabKey : String
    var tabName : String
}

struct feedListModel : Codable {
  
//    @property (nonatomic, strong) course * course;
  
  
//    @property (nonatomic, assign) long sortId;
//    @property (nonatomic, strong) videoLook * videoLook;
   
    var feedType : NSInteger
    var isTop : Bool
//    var multiLook : multiLookModel
    
    
}

//struct videoLookModel : Codable {
//    
//}



