//
//  GalleryItemCollectionViewCell.swift
//  UICollectionView_p1_Swift
//


import UIKit

class GalleryItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var itemImageView: UIImageView!
    
    func setGalleryItem(item:GalleryItem) {
        itemImageView.image = UIImage(named: item.itemImage)
    }
    
}