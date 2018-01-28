//
//  ACTopBar.swift
//  rapProject
//
//  Created by andrew cook on 1/28/18.
//  Copyright © 2018 andrew cook. All rights reserved.
//

import UIKit

enum TopBarScrollDirection {
    case left
    case right
}

enum ACTopBarTitle {
    case promoted
    case trending
    case recent
}

protocol ACTopBarDelegate {
    func topBarDidScroll(direction: TopBarScrollDirection)
}

class ACTopBar : UIView {
    
    @IBOutlet weak var scrollView: UIScrollView!
    var delegate : ACTopBarDelegate? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    @objc func scrollViewSwiped(direction: UISwipeGestureRecognizerDirection) {
        if direction == .left {
            self.delegate?.topBarDidScroll(direction: .left)
        } else if direction == .right {
            self.delegate?.topBarDidScroll(direction: .right)
        }
    }
}
