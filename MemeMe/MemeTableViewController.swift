//
//  MemeTableViewController.swift
//  MemeMe
//
//  Created by Chin-Chwen Tien on 5/31/16.
//  Copyright © 2016 CHIN-CHWEN TIEN. All rights reserved.
//

import UIKit

class MemeTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var memeTableView: UITableView!
    
    var memes: [Meme] {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    }
    
    /*********************
    * Life cycle methods *
    *********************/
    
    override func viewDidLoad() {
        print("MemeTableViewController viewDidLoad called")
        super.viewDidLoad()
    }

    override func viewWillAppear(animated: Bool) {
        print("MemeTableViewController viewWillAppear called")
        super.viewWillAppear(animated)
        
        memeTableView.delegate = self
        memeTableView.dataSource = self
        memeTableView.reloadData()
    }

    /*************************
    * Table view data source *
    *************************/

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return memes.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // #warning Incomplete implementation, return the number of rows
        let cell = tableView.dequeueReusableCellWithIdentifier("MemeTableViewCell") as! MemeTableViewCell
        let meme = self.memes[indexPath.row]
        
        // Set image
        if memes.count > 0 {
            cell.memeLabel?.text = "\(meme.topText) .. \(meme.bottomText)"
            cell.memeImage?.image = meme.memedImage
            cell.memeImage?.contentMode = UIViewContentMode.ScaleAspectFit
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
//        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let detailController = self.storyboard!.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController
        
        // Set image
        if memes.count > 0 {
            detailController.meme = self.memes[indexPath.row]
            navigationController!.pushViewController(detailController, animated: true)
        }
        
    }
    
}