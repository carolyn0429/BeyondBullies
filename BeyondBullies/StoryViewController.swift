//
//  StoryViewController.swift
//  BeyondBullies
//
//  Created by Carolyn Hung on 8/11/16.
//  Copyright © 2016 carolynhung. All rights reserved.
//

import Foundation
import UIKit
class StoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, StoryModelProtocal  {
    
    //Properties
    
    var feedItems: NSArray = NSArray()
    var selectedLocation : StoryModel = StoryModel()
    @IBOutlet weak var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set delegates and initialize homeModel
        
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        
        let storyModel = StoryModel()
        storyModel.delegate = self
        storyModel.downloadItems()
        
    }
    
    func itemsDownloaded(items: NSArray) {
        
        feedItems = items
        self.listTableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of feed items
        return feedItems.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Retrieve cell
        let cellIdentifier: String = "BasicCell"
        let myCell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)!
        // Get the location to be shown
        let item: StoryModel = feedItems[indexPath.row] as! StoryModel
        // Get references to labels of cell
        myCell.textLabel!.text = item.story
        myCell.textLabel!.numberOfLines = 0;
        
        return myCell
    }
    
}