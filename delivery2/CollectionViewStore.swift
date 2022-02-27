//
//  CollectionViewStore.swift
//  delivery2
//
//  Created by 마경미 on 2022/02/26.
//

import UIKit

struct StoreInfo{
    let name:String
    var image1:UIImage?{
        return UIImage (named: "\(name)1.jpeg")
    }
    var image2:UIImage?{
        return UIImage (named: "\(name)2.jpeg")
    }
    var image3:UIImage?{
        return UIImage (named: "\(name)3.jpeg")
    }
    
    init (name:String){
        self.name=name
    }
}

class CollectionViewStore: UICollectionViewCell {
    
    
    @IBOutlet var imgV1: UIImageView!
    @IBOutlet var imgV2: UIImageView!
    @IBOutlet var imgV3: UIImageView!
    
    @IBOutlet var storeL: UILabel!
    
    func update(info:StoreInfo){
        imgV1.image=info.image1
        imgV2.image=info.image2
        imgV3.image=info.image3
        storeL.text=info.name
    }
}

class StoreViewModel{
    let storeInfoList:[StoreInfo]=[
        StoreInfo(name:"프랭크버거"),
        StoreInfo(name:"배떡"),
    ]
    
    var countOfStoreList:Int{
        return storeInfoList.count
    }
    
    func storeInfo(at index:Int)->StoreInfo{
        return storeInfoList[index]
    }
}
