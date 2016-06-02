//
//  MemeDetailViewController.swift
//  MemeMe
//
//  Created by Chin-Chwen Tien on 5/31/16.
//  Copyright © 2016 CHIN-CHWEN TIEN. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController {

    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var memeLabel: UILabel!
    var meme: Meme!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        detailImageView.image = meme.memedImage;
//        tabBarController?.tabBar.hidden = true
//        navigationController?.setToolbarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
//        tabBarController?.tabBar.hidden = false
//        navigationController?.setToolbarHidden(false, animated: false)
    }
    
}
