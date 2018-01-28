//
//  MainFeedCell.swift
//  rapProject
//
//  Created by andrew cook on 1/28/18.
//  Copyright © 2018 andrew cook. All rights reserved.
//

import UIKit

class MainFeedCell : UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    var name: String? = nil {
        didSet {
            self.nameLabel.text = self.name
        }
    }
    var title: String? = nil {
        didSet {
            self.nameLabel.text = self.title
        }
    }
    
    var rating: Int = 0 {
        didSet {
            self.ratingLabel.text = String(self.rating)
        }
    }
    
    func setUpUI(name: String, title: String, rating: Int) {
        self.name = name
        self.title = title
        self.rating = rating
    }
}
