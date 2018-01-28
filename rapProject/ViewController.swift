//
//  ViewController.swift
//  rapProject
//
//  Created by andrew cook on 1/28/18.
//  Copyright © 2018 andrew cook. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private var currentTab : ACTopBarTitle = .promoted
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch self.currentTab {
        case .promoted: break
        case .recent: break
        case .tending: break
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
}

