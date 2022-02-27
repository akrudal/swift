//
//  CollectionViewMenu.swift
//  delivery2
//
//  Created by 마경미 on 2022/02/26.
//

import UIKit

struct ImageInfo{
    let name:String
    var image:UIImage?{
        return UIImage (named: "\(name).jpg")
    }
    
    init (name:String){
        self.name=name
    }
}

class CollectionViewMenu: UICollectionViewCell {
    @IBOutlet var imgV: UIImageView!
    @IBOutlet var nameL: UILabel!
    
    func update(info: ImageInfo){
        imgV.image=info.image
        nameL.text=info.name
    }
}

class ImageViewModel{
    let imageInfoList:[ImageInfo]=[
        ImageInfo(name:"one"),
        ImageInfo(name: "japanese"),
        ImageInfo(name:"chinese"),
        ImageInfo(name:"chicken"),
        ImageInfo(name: "rice"),
        ImageInfo(name: "rank"),
        ImageInfo(name:"dessert"),
        ImageInfo(name:"snack"),
        ImageInfo(name:"soup"),
        ImageInfo(name:"pizza"),
        ImageInfo(name: "italian"),
        ImageInfo(name: "meat"),
        ImageInfo(name: "pig"),
        ImageInfo(name:"asian"),
        ImageInfo(name:"burger"),
    ]
    
    var countOfImageList:Int{
        return imageInfoList.count
    }
    
    func imageInfo(at index:Int) -> ImageInfo{
        return imageInfoList[index]
    }
}
