//
//  BaseFeedCollectionViewCell.swift
//  IGListKitDemo
//
//  Created by Xiushan Fan on 2023/4/11.
//

import UIKit

class BaseFeedCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = UIColor("eeeeee")!
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fillFeed(_ feed:Feed?) {
        //
    }
    
}
