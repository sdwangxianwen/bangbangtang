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
    
    var customTabList : [customTabListModel]
    var feedList : [feedListModel]
    var headerItem : headerItemModel
    
}

struct headerItemModel : Codable {
    var bannerList : [bannerListModel]
//    var hotDiscuss : [bannerListModel]
//    var searchSug : String
//    var headTeamList : [headerItemModel]
  
}

struct bannerListModel : Codable {
   
    var picUrl : String
    var uri : String
   
}
struct headTeamListModel : Codable {
   
    var iconUrl : NSInteger
    var teamUrl : String
    var id : NSInteger
    
}

struct customTabListModel : Codable {
    var tabKey : String
    var tabName : String
}

struct feedListModel : Codable {
    
//    var feedType : NSInteger
//    var isTop : Bool
//    var course : courseModel
//    var multiLook : multiLookModel
//    var videoLook : videoLookModel
    
}

struct courseModel : Codable {
    var activityTag : String
    var ageLevel : String
    var commentNum : NSInteger
    var contentNum : NSInteger
    var courseDesc : String
    var courseId : String
    var courseMark : NSInteger
    var coverPicUrl : NSInteger
    var createTime : String
    var flagNum : NSInteger
    var isFlaged : Bool
    var likedNum : NSInteger
    var title : String
    var stepNum : NSInteger
    var picNum : NSInteger
    var likedRelation : NSInteger
    var w2hRatio : CGFloat
    var tagList : [tagListModel]
    var sender : senderModel
    
    
}

struct multiLookModel : Codable {
    var activityTag : String
    var ageLevel : String
    var commentNum : NSInteger
    var contentNum : NSInteger
    var createTime : String
    var multiLookDesc : String
    var multiLookId : NSInteger
    var coverPicUrl : NSInteger
    var flagNum : NSInteger
    var isFlaged : Bool
    var likedNum : NSInteger
    var title : String
}

struct videoLookModel : Codable {
    
}

struct tagListModel : Codable {
    
}
struct senderModel : Codable {
    
}



