//
//  FYPageBaseViewController.swift
//  bangbangtang
//
//  Created by wang on 2020/4/27.
//  Copyright © 2020 wang. All rights reserved.
//

import UIKit
import JXSegmentedView
import JXPagingView

extension JXPagingListContainerView: JXSegmentedViewListContainer {}

class FYPageBaseViewController: FYBaseViewController {
    
    var tableHeaderViewHeight: Int = 200
    var headerInSectionHeight: Int = 50
    var isNeedHeader = false
    var isNeedFooter = false
    
   
    lazy var pagingView: JXPagingView = preferredPagingView()
    let dataSource: JXSegmentedTitleDataSource = JXSegmentedTitleDataSource()
    lazy var segmentedView: JXSegmentedView = JXSegmentedView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: CGFloat(headerInSectionHeight)))
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK:数据源
        dataSource.titleSelectedColor = UIColor(red: 105/255, green: 144/255, blue: 239/255, alpha: 1)
        dataSource.titleNormalColor = UIColor.black
        dataSource.isTitleColorGradientEnabled = true
        dataSource.isTitleZoomEnabled = true
        
        segmentedView.backgroundColor = UIColor.white
        segmentedView.delegate = self
        segmentedView.isContentScrollViewClickTransitionAnimationEnabled = true
        segmentedView.dataSource = dataSource
        
        let lineView = JXSegmentedIndicatorLineView()
        lineView.indicatorColor = UIColor(red: 105/255, green: 144/255, blue: 239/255, alpha: 1)
        lineView.indicatorWidth = 30
        segmentedView.indicators = [lineView]
        
        pagingView.mainTableView.gestureDelegate = self
        pagingView.pinSectionHeaderVerticalOffset = Int(kNavBarHeight - kStatusBarHeight)
        pagingView.frame = CGRect(x: 0, y:kStatusBarHeight , width: kScreenWidth, height: kScreenHeight - kTabBarHeight - kBottomLineHeight - kStatusBarHeight)
        self.view.addSubview(pagingView)
        segmentedView.listContainer = pagingView.listContainerView
        
    }
    
    func preferredPagingView() -> JXPagingView {
        return JXPagingView(delegate: self)
    }
}


extension FYPageBaseViewController: JXPagingViewDelegate {
    
   
    func tableHeaderViewHeight(in pagingView: JXPagingView) -> Int {
        return tableHeaderViewHeight
    }

    func tableHeaderView(in pagingView: JXPagingView) -> UIView {
        return UIView.init()
    }

    func heightForPinSectionHeader(in pagingView: JXPagingView) -> Int {
        return headerInSectionHeight
    }

    func viewForPinSectionHeader(in pagingView: JXPagingView) -> UIView {
        return segmentedView
    }

    func numberOfLists(in pagingView: JXPagingView) -> Int {
        return self.dataSource.titles.count
    }

    func pagingView(_ pagingView: JXPagingView, initListAtIndex index: Int) -> JXPagingViewListViewDelegate {
        let list = FYFeedListViewController()
        list.title = self.dataSource.titles[index]
        return list
    }
}

extension FYPageBaseViewController: JXSegmentedViewDelegate {
    func segmentedView(_ segmentedView: JXSegmentedView, didSelectedItemAt index: Int) {
           self.navigationController?.interactivePopGestureRecognizer?.isEnabled = (index == 0)
       }
}

extension FYPageBaseViewController: JXPagingMainTableViewGestureDelegate {
    func mainTableViewGestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        //禁止segmentedView左右滑动的时候，上下和左右都可以滚动
        if otherGestureRecognizer == segmentedView.collectionView.panGestureRecognizer {
            return false
        }
        return gestureRecognizer.isKind(of: UIPanGestureRecognizer.self) && otherGestureRecognizer.isKind(of: UIPanGestureRecognizer.self)
    }
}


