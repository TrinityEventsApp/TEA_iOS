//
//  GalleryItem.swift
//  UICollectionView_p1_Swift
//


import Foundation

class GalleryItem {
    
    var itemImage:String
    var selected:Bool
    
    init(dataDictionary:Dictionary<String,String>) {
        itemImage = dataDictionary["itemImage"]!
        selected=false
    }
    
    class func newGalleryItem(dataDictionary:Dictionary<String,String>) -> GalleryItem {
        return GalleryItem(dataDictionary: dataDictionary)
    }
    
}
