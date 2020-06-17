//
//  ViewController.swift
//  youtube-onedaybuild
//
//  Created by Leighton  Rangi on 27/05/20.
//  Copyright © 2020 Leighton  Rangi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
    // Above is allowng the controller to conform to protocols

    
    @IBOutlet weak var tableView: UITableView!
    
    
    var model = Model() // use this to connect to Model.swift files data
    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        // Set iteslf as the datasource and the delegate
        tableView.dataSource = self
        tableView.delegate = self // Handles user interaction
        
        // Set itself as the delegate of the model
        model.delegate = self
        
        model.getVideos()
    }
    
    // MARK: - Model Delegate Methods
    
    func videosFetched(_ videos: [Video]) {
        
        // Set the returned videos to our table property
        self.videos = videos // refer to var videos property above and assign the list of videos that the model returns
        
        // Refresh the tableView
        tableView.reloadData()
    }
    
    // MARK: - TableView Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
        // Configure the cell with the data
        let video = self.videos[indexPath.row]
        
        cell.setCell(video)
        // Return Cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}

