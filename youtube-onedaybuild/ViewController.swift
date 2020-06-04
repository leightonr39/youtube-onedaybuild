//
//  ViewController.swift
//  youtube-onedaybuild
//
//  Created by Leighton  Rangi on 27/05/20.
//  Copyright © 2020 Leighton  Rangi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var model = Model() // use this to connect to Model.swift files data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.getVideos()
    }


}

