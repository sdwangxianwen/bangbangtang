//
//  FYNavgationController.swift
//  qhm
//
//  Created by wang on 2019/4/12.
//  Copyright © 2019 wang. All rights reserved.
//

import UIKit


class FYNavgationController: UINavigationController{
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    func setupLayout() {
        
        let navigationBar = UINavigationBar.appearance()
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
        guard let gester = self.interactivePopGestureRecognizer else { return  }
        let pan = UIPanGestureRecognizer.init(target: gester.delegate, action: NSSelectorFromString("handleNavigationTransition:"))
        gester.view?.addGestureRecognizer(pan)
        gester.delaysTouchesBegan = true
        pan.delegate = self
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewController.navigationItem.leftBarButtonItem == nil && viewControllers.count >= 1 {
            viewController.navigationItem.leftBarButtonItem = creatBackButton()
            viewController.hidesBottomBarWhenPushed = true
        }
       
        super.pushViewController(viewController, animated: animated)
    }
    
    func creatBackButton() -> UIBarButtonItem {
        
        return UIBarButtonItem(image: UIImage(named: "bbt_nav_back_n")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(pop))
    }
     
   @objc func pop()  {
        self.popViewController(animated: true)
    }
    
}
extension FYNavgationController : UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return self.children.count > 1
    }
    
}



//    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
//           let isLeftToRight = UIApplication.shared.userInterfaceLayoutDirection == .leftToRight
//           guard let ges = gestureRecognizer as? UIPanGestureRecognizer else { return true }
//           if ges.translation(in: gestureRecognizer.view).x * (isLeftToRight ? 1 : -1) <= 0
//               || disablePopGesture {
//               return false
//           }
//           return viewControllers.count != 1;
//       }
//
//    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRequireFailureOf otherGestureRecognizer: UIGestureRecognizer) -> Bool {
//        return true
//    }
//}
//
//extension FYNavgationController {
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        guard let topVC = topViewController else { return .lightContent }
//        return topVC.preferredStatusBarStyle
//    }
//}
//// 枚举
//enum FYNavigationBarStyle {
//    case theme
//    case clear
//    case white
//}
//
//extension UINavigationController {
//
//    private struct AssociatedKeys {
//        static var disablePopGesture: Void?
//    }
//
//    var disablePopGesture: Bool {
//        get {
//            return objc_getAssociatedObject(self, &AssociatedKeys.disablePopGesture) as? Bool ?? false
//        }
//        set {
//            objc_setAssociatedObject(self, &AssociatedKeys.disablePopGesture, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//        }
//    }
//
//    func barStyle(_ style: FYNavigationBarStyle) {
//        switch style {
//        case .theme:
//            navigationBar.barStyle = .black
//            navigationBar.setBackgroundImage(UIImage(named: "nav_bg"), for: .default)
//            navigationBar.shadowImage = UIImage()
//        case .clear:
//            navigationBar.barStyle = .black
//            navigationBar.setBackgroundImage(UIImage(), for: .default)
//            navigationBar.shadowImage = UIImage()
//        case .white:
//            navigationBar.barStyle = .default
//            navigationBar.setBackgroundImage(UIColor.white.image(), for: .default)
//            navigationBar.shadowImage = nil
//        }
//
//
//    }
//}

