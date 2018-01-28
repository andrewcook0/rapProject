//
//  ViewController.swift
//  rapProject
//
//  Created by andrew cook on 1/28/18.
//  Copyright © 2018 andrew cook. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ACTopBarDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView : UITableView!
    @IBOutlet weak var acTopBar : ACTopBar!
    
    private var currentTab : ACTopBarTitle = .promoted {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var tabData: ACMainFeedData? = nil {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.acTopBar.delegate = self
        self.tableView.estimatedRowHeight = 60
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.register(UINib(nibName: "MainFeedCell", bundle: nil), forCellReuseIdentifier: "MainFeedCell")
    }
    
    func topBarDidScroll(direction: TopBarScrollDirection) {
        // switches current tab
        switch self.currentTab {
        case .promoted:
            if direction == .left {
                self.currentTab = .recent
            } else {
                self.currentTab = .trending
            }
        case .recent:
            guard direction == .left else { return }
            self.currentTab = .promoted
        case .trending:
            guard direction == .right else { return }
            self.currentTab = .promoted
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch self.currentTab {
        case .promoted: return self.tabData?.promotedData?.count ?? 10
            case .recent: return self.tabData?.recentData?.count ?? 10
            case .trending: return self.tabData?.trendingData?.count ?? 10
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "MainFeedCell") as? MainFeedCell
        
        func setUpCell(type: ACTopBarTitle) {
            let data : [ACMainFeedDataObject]?
            switch type {
            case .promoted: data = (self.tabData?.promotedData) ?? []
                case .recent: data = self.tabData?.recentData ?? []
                case .trending: data = self.tabData?.trendingData ?? []
            }
            
            guard (data?.count ?? 0) - 1 >= indexPath.row else { return }
            cell?.name = data?[indexPath.row].name ?? ""
            cell?.title = data?[indexPath.row].title ?? ""
            cell?.rating = data?[indexPath.row].rating ?? 0
        }
        
        setUpCell(type: self.currentTab)
        return cell ?? UITableViewCell()
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}















