//
//  ViewController.swift
//  IGListKitDemo
//
//  Created by Xiushan Fan on 2023/4/10.
//

import UIKit
import IGListKit
import PinLayout
import SDWebImage

class FeedViewController: UIViewController,ListAdapterDataSource {
    
    var collectionView:UICollectionView!
    var feedList:[Feed] = [Feed]()
    var adapter:ListAdapter!    //要声明为成员变量，否则报错
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView = UICollectionView.init(frame: .init(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: UICollectionViewFlowLayout())
        let updater = ListAdapterUpdater()
        adapter = ListAdapter(updater: updater, viewController: self)
        adapter.dataSource = self
        adapter.collectionView = collectionView
        self.view.addSubview(collectionView)
        //
        let path = Bundle.main.path(forResource: "feed", ofType: "json")!
        let url = URL.init(filePath: path)
        let data = try! Data.init(contentsOf: url)
        let feed = String.init(data: data, encoding: String.Encoding.utf8)
        if let tfeed = feed {
            self.feedList = try! JSONDecoder().decode([Feed].self, from: tfeed.data(using: .utf8)!)
            print(feedList)
            adapter.reloadData()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.collectionView.pin.all()
    }
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return feedList
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        print("sectionControllerFor")
        let feedSectionCtrl = FeedSectionController()
        feedSectionCtrl.inset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        return feedSectionCtrl
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        print("emptyView")
        return nil
    }

}


