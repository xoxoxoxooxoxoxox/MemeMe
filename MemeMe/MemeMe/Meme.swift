//
//  Meme.swift
//  MemeMe
//
//  Created by Chin-Chwen Tien on 5/31/16.
//  Copyright © 2016 CHIN-CHWEN TIEN. All rights reserved.
//

import Foundation
import UIKit

/*************************
 * Meme object definition *
 *************************/

struct Meme {
    
    let topText: String!
    let bottomText: String!
    let originalImage: UIImage!
    let memedImage: UIImage!
    
    init(topText: String, bottomText: String, originalImage: UIImage, memedImage: UIImage) {
        self.topText = topText
        self.bottomText = bottomText
        self.originalImage  = originalImage
        self.memedImage = memedImage
    }
    
}