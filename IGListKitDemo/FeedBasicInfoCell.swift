//
//  BasicInfoCell.swift
//  IGListKitDemo
//
//  Created by Xiushan Fan on 2023/4/11.
//

import UIKit
import fanthus_base_lib
import SDWebImage

class FeedBasicInfoCell: BaseFeedCollectionViewCell {
    
    var avatarIV:UIImageView!
    var nameLabel:UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        avatarIV = EZUI.imageView(imgName: "", superView: self.contentView)
        EZUI.setLayer(view: avatarIV, radius: 5, borderWidth: 1, borderColor: "ffffff")
        nameLabel = EZUI.label(txt: "", color: "000000", fontName: .Medium, size: 12, align: .center, superView: self.contentView, lineNum: 1)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        avatarIV.pin.left(5).vCenter().width(30).height(30)
        nameLabel.pin.right(of: avatarIV).marginLeft(10).vCenter().height(30).sizeToFit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func fillFeed(_ feed: Feed?) {
        avatarIV.sd_setImage(with: URL.init(string: feed?.avatar ?? ""))
        nameLabel.text = feed?.name
    }
    
}
