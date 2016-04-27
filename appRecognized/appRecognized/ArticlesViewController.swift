//
//  ArticlesViewController.swift
//  appRecognized
//
//  Created by Karine Ould on 27/04/2016.
//  Copyright © 2016 Karine Ould. All rights reserved.
//

import UIKit

class ArticlesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{

    
    var dataImage : [String] = ["image1.jpg", "image2.jpg", "image3.jpg", "image4.jpg", "image5.jpg", "image6.jpg", "image7.jpg", "image8.jpg"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell : articleCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! articleCollectionViewCell
        cell.imgColCell.image = UIImage(named: dataImage[indexPath.row])
        
        return cell
    }
}
