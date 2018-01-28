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
    case tending
    case recent
}

protocol ACTopBarDelegate {
    func topBarDidScroll(direction: TopBarScrollDirection)
}

class ACTopBar : UIView, UIScrollViewDelegate {
    
    var delegate : ACTopBarDelegate? = nil
    
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if self.lastContentOffset < scrollView.contentOffset.x {
            self.delegate?.topBarDidScroll(direction: .right)
        }
        else {
            self.delegate?.topBarDidScroll(direction: .left)
        }
    }
}
