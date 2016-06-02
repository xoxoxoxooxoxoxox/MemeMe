//
//  MemeCollectionViewController.swift
//  MemeMe
//
//  Created by Chin-Chwen Tien on 6/1/16.
//  Copyright © 2016 CHIN-CHWEN TIEN. All rights reserved.
//

import Foundation
import UIKit

class  MemeCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    //TODO: Add outlet to flowLayout here.
    
    @IBOutlet var flowLayout: UICollectionViewFlowLayout!
    
    @IBOutlet var memeCollectionView: UICollectionView!
    
    var memes: [Meme] {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    }
    
    
    
    /*********************
    * Life Cycle Methods *
    *********************/
    
    override func viewDidLoad() {
        print("MemeCollectionViewController viewDidLoad called")
        super.viewDidLoad()
        
        //TODO: Implement flowLayout here.
        let space: CGFloat = 3.0
        let frameSize = memeCollectionView?.frame.size
        let shorterSide = min(frameSize!.height, frameSize!.width)
        let dimension1 = (shorterSide - (2 * space))/3.0
        
        flowLayout?.minimumInteritemSpacing = space
        flowLayout?.minimumLineSpacing = space
        flowLayout?.itemSize = CGSizeMake(dimension1, dimension1)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        print("MemeCollectionViewController viewWillAppear called")
        super.viewWillAppear(animated)
        memeCollectionView?.delegate = self
        memeCollectionView?.dataSource = self
        memeCollectionView?.reloadData()
        
    }
    
    /****************************
    * Collection View Data Source
    ****************************/
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MemeCollectionViewCell", forIndexPath: indexPath) as! MemeCollectionViewCell
        
        let meme = memes[indexPath.row]
        
        if memes.count > 0 {
            cell.memeLabel?.text = "\(meme.topText) .. \(meme.bottomText)"
            cell.memeImage?.image = meme.memedImage
            cell.memeImage?.contentMode = UIViewContentMode.ScaleAspectFit
        }
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath:NSIndexPath) {
//        
//        memeCollectionView.deselectItemAtIndexPath(indexPath, animated: true)
        
        let controller = self.storyboard!.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController
        
        if memes.count > 0 {
            controller.meme = self.memes[indexPath.row]
            navigationController!.pushViewController(controller, animated: true)
        }
        
    }
    
    
}
