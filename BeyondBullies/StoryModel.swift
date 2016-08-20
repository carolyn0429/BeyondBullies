//
//  StoryModel.swift
//  BeyondBullies
//
//  Created by Carolyn Hung on 8/11/16.
//  Copyright © 2016 carolynhung. All rights reserved.
//

import Foundation
protocol StoryModelProtocal: class {
    func itemsDownloaded(items: NSArray)
}

class StoryModel: NSObject,NSURLSessionDataDelegate {
    //properties
    var story: String?
    
    //empty constructor
    override init()
    {
    }
    
    //construct with @story parameter
    init(story: String) {
        self.story = story
    }
    
    //prints object's current state
    override var description: String {
        return "Story: \(story)"
    }
    
    //properties
    
    weak var delegate: StoryModelProtocal!
    
    var data : NSMutableData = NSMutableData()
    
    let urlPath: String = "http://carolynhung.com/service.php"
    
    func downloadItems() {
        
        let url: NSURL = NSURL(string: urlPath)!
        var session: NSURLSession!
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        
        
        session = NSURLSession(configuration: configuration, delegate: self, delegateQueue: nil)
        
        let task = session.dataTaskWithURL(url)
        
        task.resume()
        
    }
    
    func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, didReceiveData data: NSData) {
        self.data.appendData(data);
        
    }
    
    func URLSession(session: NSURLSession, task: NSURLSessionTask, didCompleteWithError error: NSError?) {
        if error != nil {
            print("Failed to download data")
        }else {
            print("Data downloaded")
            self.parseJSON()
        }
        
    }
    
    func parseJSON() {
        
        var jsonResult: NSMutableArray = NSMutableArray()
        
        do{
            jsonResult = try NSJSONSerialization.JSONObjectWithData(self.data, options:NSJSONReadingOptions.AllowFragments) as! NSMutableArray
            
        } catch let error as NSError {
            print(error)
            
        }
        
        var jsonElement: NSDictionary = NSDictionary()
        let stories: NSMutableArray = NSMutableArray()
        
        for i in 0..<jsonResult.count
        {
            
            jsonElement = jsonResult[i] as! NSDictionary
            
            let story_model = StoryModel()
            
            //the following insures none of the JsonElement values are nil through optional binding
            if let story = jsonElement["story_of_the_day"] as? String
            
            {
                
                story_model.story = story
                
            }
            
            stories.addObject(story_model)
            
        }
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            
            self.delegate.itemsDownloaded(stories)
            
        })
    }
    
}

