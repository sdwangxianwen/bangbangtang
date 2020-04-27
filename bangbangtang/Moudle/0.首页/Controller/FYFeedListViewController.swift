//
//  FYFeedListViewController.swift
//  bangbangtang
//
//  Created by wang on 2020/4/26.
//  Copyright © 2020 wang. All rights reserved.
//

import UIKit
import JXPagingView


class FYFeedListViewController: FYBaseViewController {
    var listViewDidScrollCallback: ((UIScrollView) -> ())?
    lazy var tableView: UITableView = UITableView(frame: CGRect.zero, style: .plain)
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension FYFeedListViewController: JXPagingViewListViewDelegate {
    func listView() -> UIView {
        return view
    }

    func listViewDidScrollCallback(callback: @escaping (UIScrollView) -> ()) {
        self.listViewDidScrollCallback = callback
    }

    func listScrollView() -> UIScrollView {
        return self.tableView
    }

    func listWillAppear() {
        print("\(self.title ?? ""):\(#function)")
    }

    func listDidAppear() {
        print("\(self.title ?? ""):\(#function)")
    }

    func listWillDisappear() {
        print("\(self.title ?? ""):\(#function)")
    }

    func listDidDisappear() {
        print("\(self.title ?? ""):\(#function)")
    }
}
