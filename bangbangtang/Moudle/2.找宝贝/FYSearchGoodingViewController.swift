//
//  FYSearchGoodingViewController.swift
//  bangbangtang
//
//  Created by wang on 2020/4/26.
//  Copyright © 2020 wang. All rights reserved.
//

import UIKit

class FYSearchGoodingViewController: FYBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let vc = FYNoteDetailViewController.init()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

}
