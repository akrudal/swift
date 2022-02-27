//
//  CollectionViewBest.swift
//  delivery2
//
//  Created by 마경미 on 2022/02/27.
//

import UIKit

struct BestInfo{
    let name:String
    var image:UIImage?{
        return UIImage (named: "\(name).jpeg")
    }
    let fee:String
    
    init (name:String,fee:String){
        self.name=name
        self.fee=fee
    }
}

class CollectionViewBest: UICollectionViewCell {
    
    @IBOutlet var bestImgV: UIImageView!
    @IBOutlet var bestNameL: UILabel!
    @IBOutlet var bestFeeL: UILabel!
    
    func update(info:BestInfo){
        bestImgV.image=info.image
        bestNameL.text=info.name
        bestFeeL.text=info.fee
    }
}

class BestViewModel{
    let bestInfoList:[BestInfo]=[
        BestInfo(name:"이디야",fee:"2,100원"),
        BestInfo(name:"뚜레쥬르",fee:"3,000원"),
        BestInfo(name:"BHC치킨",fee:"3,000원"),
        BestInfo(name:"빽다방",fee:"0원~2,800원"),
    ]
    
    var countOfBestList:Int{
        return bestInfoList.count
    }
    
    func bestInfo(at index:Int) -> BestInfo{
        return bestInfoList[index]
    }
}
