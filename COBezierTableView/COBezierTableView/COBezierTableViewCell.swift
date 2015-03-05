//
//  COBezierTableViewCell.swift
//  COBezierTableView
//
//  Created by Knut Inge Grosland on 2015-03-01.
//  Copyright (c) 2015 Cocmoc. All rights reserved.
//

import UIKit

// MARK: - InternalCOBezierTableViewCellDelegate

internal protocol InternalCOBezierTableViewCellDelegate:class {
    func bezierTableViewCellDidSelect(cell: COBezierTableViewCell)
}

// MARK: - COBezierTableViewCell

class COBezierTableViewCell : UIView {
    
    internal weak var internalCellDelegate:InternalCOBezierTableViewCellDelegate?

    let pageReuseIdentifier : String?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action:Selector("_internalHandleTap:")))
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action:Selector("_internalHandleTap:")))
    }
    
    func prepareForReuse() {
        // Should be overriden in superclass 
    }
    
    // MARK: Internal

    internal final func _internalHandleTap(recognizer: UITapGestureRecognizer) {
        self.internalCellDelegate!.bezierTableViewCellDidSelect(self)
    }
}

