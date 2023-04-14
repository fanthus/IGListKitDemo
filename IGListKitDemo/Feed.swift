//
//  Feed.swift
//  IGListKitDemo
//
//  Created by Xiushan Fan on 2023/4/11.
//

import UIKit
import IGListKit

enum FeedType:Int,Codable  {
    case kText = 1
    case kPic = 2
}

class Pic:Codable {
    var url:String?
    init(url: String? = nil) {
        self.url = url
    }
}

class Feed:Codable {
    var id:Int64?
    var name:String?
    var avatar:String?
    var type:FeedType?
    var content:String?
    var pic:[Pic]?
}

extension Feed: ListDiffable {

    func diffIdentifier() -> NSObjectProtocol {
        return "\(String(describing: id))" as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let feed = object as? Feed else { return false }
        return feed.diffIdentifier().isEqual(self.diffIdentifier())
    }
    
}
