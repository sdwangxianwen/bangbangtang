//
//  ACConfig.swift
//  urAc
//
//  Created by wang on 2020/4/21.
//  Copyright © 2020 wang. All rights reserved.
//

import UIKit

let IS_DEBUG = true


func ACLog<T>(_ message: T, file:String = #file, method:String = #function, line: Int = #line) {
    let msg = "\((file as NSString).lastPathComponent)[\(line)], \(method): \(message) T:\(Thread.current.name ?? "")"
    print(msg)
}

//获取版本号
func getApp_version() -> String {
    let infoDict = Bundle.main.infoDictionary!
    let minorVersion = infoDict["CFBundleShortVersionString"]
    return minorVersion as! String
    
}


/// 判断是否为iphonex 系列
///
/// - Returns: Bool
func isPhoneX() ->Bool {
    if #available(iOS 11.0, *) {
        if UIApplication.shared.windows.first?.safeAreaInsets.bottom != 0 {
            return true
        }
    }
    return false
}

//屏幕宽度
let kStatusBarHeight  = UIApplication.shared.windows.first?.windowScene?.statusBarManager?.statusBarFrame.size.height ?? 0
var kScreenWidth = UIScreen.main.bounds.size.width
/// 屏幕高度
var kScreenHeight = UIScreen.main.bounds.size.height
/// tabBar高度
let kTabBarHeight:CGFloat = isPhoneX() ? 83 : 49
/// nav高度
let kNavBarHeight:CGFloat = isPhoneX() ? 88 : 64
/// 底部手势框的高度
let kBottomLineHeight : CGFloat = isPhoneX() ? 34 : 0

/// 设置随机颜色
func UIColorRandom() -> UIColor {
    let color: UIColor = UIColor.init(red: (((CGFloat)((arc4random() % 256)) / 255.0)), green: (((CGFloat)((arc4random() % 256)) / 255.0)), blue: (((CGFloat)((arc4random() % 256)) / 255.0)), alpha: 1.0);
    return color;
}


func getCurrentController() -> UIViewController {
    
    if #available(iOS 13.0, *) {
        var currentVC = UIApplication.shared.windows.first?.rootViewController
                while (currentVC?.presentedViewController != nil) {
                  currentVC = currentVC?.presentedViewController
                }
                if (currentVC?.isKind(of: UITabBarController.self))! {
                    currentVC = (currentVC as! UITabBarController).selectedViewController
                }
                if (currentVC?.isKind(of: UINavigationController.self))! {
                    currentVC = (currentVC as! UINavigationController).visibleViewController
                }
                return currentVC!
    } else {
        var currentVC = UIApplication.shared.keyWindow?.rootViewController
                while (currentVC?.presentedViewController != nil) {
                  currentVC = currentVC?.presentedViewController
                }
                if (currentVC?.isKind(of: UITabBarController.self))! {
                    currentVC = (currentVC as! UITabBarController).selectedViewController
                }
                if (currentVC?.isKind(of: UINavigationController.self))! {
                    currentVC = (currentVC as! UINavigationController).visibleViewController
                }
                return currentVC!
    }
    
}

extension String {
    //MARK:是否是有效的电话号码
    func isValidMobileNumber() -> Bool {
        let mobile = "^1(3[0-9]|4[57]|5[0-35-9]|7[0135678]|8[0-9]|9[8])\\d{8}$"
        let CM = "^1(3[4-9]|4[7]|5[0-27-9]|6[6]|7[08]|8[2-478])\\d{8}$";
        let CU = "^1(3[0-2]|4[5]|5[56]|7[0156]|8[56]|9[9])\\d{8}$"
        let CT = "^1(3[3]|4[9]|53|7[037]|8[019])\\d{8}$"
        let PHS = "^0(10|2[0-5789]|\\d{3})\\d{7,8}$"
        
        let regextestMobile = NSPredicate(format: "SELF MATCHES %@",mobile)
        let regextestCM = NSPredicate(format: "SELF MATCHES %@", CM)
        let regextestCT = NSPredicate(format: "SELF MATCHES %@", CT)
        let regextestPHS = NSPredicate(format: "SELF MATCHES %@", PHS)
        let regextestCU = NSPredicate(format: "SELF MATCHES %@", CU)
        if (regextestMobile.evaluate(with: self) == true) ||
            regextestCM.evaluate(with: self) == true ||
            regextestCT.evaluate(with:self) == true ||
            regextestCU.evaluate(with: self) == true ||
            regextestPHS.evaluate(with: self) == true {
            return true
        }
        return false
    }
    //MARK:是否是有效的银行卡
    func isValidBankCardNumber() -> Bool {
        let BANKCARD = "^(\\d{16}|\\d{19})$";
        let predicate = NSPredicate(format: "SELF MATCHES %@", BANKCARD)
        return predicate.evaluate(with: self)
    }
    
    //MARK:是否是有效的邮箱
    func isValidEmail() -> Bool {
        let emailRegex = "^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\\.[a-zA-Z0-9-]+)*\\.[a-zA-Z0-9]{2,6}$"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: self)
    }
    
}

public extension UIView {
    /// x
    var x: CGFloat {
        get {
            return frame.origin.x
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.origin.x    = newValue
            frame                 = tempFrame
        }
    }
    
    ///y
    var y : CGFloat {
        get {
            return frame.origin.y
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.origin.y = newValue
            frame = tempFrame
            
        }
    }
    
    ///height
    var height : CGFloat {
        get {
            return frame.size.height
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.size.height = newValue
            frame = tempFrame
        }
    }
    
    ///width
    var width : CGFloat {
        get {
            return frame.size.width
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.size.width = newValue
            frame = tempFrame
        }
    }
    
    //size
    var size : CGSize {
        get {
            return frame.size
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.size = newValue
            frame = tempFrame
        }
    }
    
    //centerx
    var centerX: CGFloat {
        get {
            return center.x
        }
        set(newValue) {
            var tempCenter: CGPoint = center
            tempCenter.x = newValue
            center = tempCenter
        }
    }
    
    ///centery
    var centerY: CGFloat {
        get {
            return center.y
        }
        set(newValue) {
            var tempCenter: CGPoint = center
            tempCenter.y = newValue
            center = tempCenter
        }
    }
    
    ///origin
    var origin : CGPoint {
        get {
            return frame.origin
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.origin = newValue
            frame = tempFrame
        }
    }
    
    ///maxX
    var maxX : CGFloat {
        get {
            return frame.origin.x + frame.size.width;
        }
    }
    
    ///maxY
    var maxY : CGFloat {
        get {
            return frame.origin.y + frame.size.height
        }
    }
    
    ///minX
    var minX : CGFloat {
        get{
            return frame.minX
        }
    }
    
    ///minY
    var minY : CGFloat {
        get{
            return frame.minY
        }
    }
}

class ACConfig: NSObject {
    
   

}
