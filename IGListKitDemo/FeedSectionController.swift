//
//  FeedSectionController.swift
//  IGListKitDemo
//
//  Created by Xiushan Fan on 2023/4/11.
//

import UIKit
import IGListKit

class FeedSectionController: ListSectionController  {
    var feed:Feed?
    
    override func didUpdate(to object: Any) {
        feed = object as? Feed
    }
    
    override func numberOfItems() -> Int {
        var count = 1
        if let _ = feed?.content {
            count = count + 1
        }
        if let _ = feed?.pic {
            count = count + 1
        }
        return count
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        if index == 0 {
            let basicInfoCell = self.collectionContext?.dequeueReusableCell(of: FeedBasicInfoCell.self, for: self, at: index) as? FeedBasicInfoCell
            basicInfoCell!.fillFeed(feed)
            return basicInfoCell!
        } else if index == 1 {
            let contentCell = self.collectionContext?.dequeueReusableCell(of: FeedContentCell.self, for: self, at: index) as? FeedContentCell
            contentCell!.fillFeed(feed)
            return contentCell!
        } else if index == 2 {
            let picCell = self.collectionContext?.dequeueReusableCell(of: FeedPicCell.self, for: self, at: index) as? FeedPicCell
            picCell!.fillFeed(feed)
            return picCell!
        }
        return UICollectionViewCell()
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        let width = UIScreen.main.bounds.width
        if index == 0 {
            return CGSize.init(width: width, height: 50)
        } else if index == 1 {
            return CGSize.init(width: width, height: 50)
        } else if index == 2 {
            return .init(width: width, height: 100)
        }
        return .zero
    }
    
}
