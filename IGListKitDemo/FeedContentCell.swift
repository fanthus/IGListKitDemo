//
//  FeedContentCell.swift
//  IGListKitDemo
//
//  Created by Xiushan Fan on 2023/4/11.
//

import UIKit
import fanthus_base_lib

class FeedContentCell: BaseFeedCollectionViewCell {
    var contentLabel:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentLabel = EZUI.label(txt: "", color: "000000", fontName: .Regular, size: 15, align: .left, superView: self.contentView, lineNum: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentLabel.pin.all()
    }
    
    override func fillFeed(_ feed: Feed?) {
        contentLabel.text = feed?.content
    }

}
