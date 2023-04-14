//
//  FeedPicCell.swift
//  IGListKitDemo
//
//  Created by Xiushan Fan on 2023/4/11.
//

import UIKit
import fanthus_base_lib
import SDWebImage

class FeedPicCell: BaseFeedCollectionViewCell {
    
    var picImageView:UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        picImageView = EZUI.imageView(imgName: "", superView: self.contentView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        picImageView.pin.top().left().width(100).height(100)
    }
    
    override func fillFeed(_ feed: Feed?) {
        picImageView.sd_setImage(with: URL.init(string: feed?.pic?.first?.url ?? ""))
    }

}
