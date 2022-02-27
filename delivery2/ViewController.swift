//
//  ViewController.swift
//  delivery2
//
//  Created by 마경미 on 2022/02/25.
//

import UIKit

struct CustomData {
    var title:String
    var image:UIImage
}

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate {
    
    @IBOutlet var collectionBanner: UICollectionView!
    @IBOutlet var collectionMenu: UICollectionView!
    @IBOutlet var collectionStore: UICollectionView!
    @IBOutlet var collectionBest: UICollectionView!
    
    let viewModel=ImageViewModel()
    let storeviewModel=StoreViewModel()
    let bestviewModel=BestViewModel()
    
    let data = [
       CustomData(title: "event1", image: #imageLiteral(resourceName: "banner2")),
       CustomData(title: "event2", image: #imageLiteral(resourceName: "banner8")),
       CustomData(title:"event3", image: #imageLiteral(resourceName: "banner5")),
       CustomData(title: "event4", image: #imageLiteral(resourceName: "banner6")),
       CustomData(title: "event5", image: #imageLiteral(resourceName: "banner4")),
       CustomData(title: "event6", image: #imageLiteral(resourceName: "banner7")),
       CustomData(title: "event7", image: #imageLiteral(resourceName: "banner3")),
    ]
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // collectionView에 총 몇개의 cell을 표시할 것인지를 구현, int형을 return
        if collectionView == collectionMenu {
            return viewModel.countOfImageList
        } else if collectionView == collectionBanner {
            return data.count
        } else if collectionView == collectionStore{
            return storeviewModel.countOfStoreList
        } else {
            return 5
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath:IndexPath)->CGSize{
        if collectionView == collectionMenu {
            return CGSize(width:70,height:70)
        } else if collectionView == collectionBanner {
            return CGSize(width:collectionView.frame.width,height:200)
        } else {
            return CGSize(width:collectionView.frame.width, height: 200)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //  해당 cell에 무슨 cell을 표시할지를 결정, UICollectionViewCell을 return
        if collectionView == collectionMenu {
            let cellA = collectionMenu.dequeueReusableCell(withReuseIdentifier: "cellA", for: indexPath) as! CollectionViewMenu
         
            let imageInfo=viewModel.imageInfo(at: indexPath.item)
            cellA.update(info:imageInfo)
            
            return cellA
            
        } else if collectionView == collectionBanner {
            let cellB=collectionBanner.dequeueReusableCell(withReuseIdentifier:"cellB",for:indexPath) as! CollectionViewBanner
            
            cellB.data=self.data[indexPath.row]
            return cellB
        } else if collectionView == collectionStore {
            let cellC = collectionStore.dequeueReusableCell(withReuseIdentifier: "cellC",for:indexPath) as! CollectionViewStore
            
            cellC.contentView.layer.cornerRadius=30
            cellC.contentView.backgroundColor = .white
            cellC.contentView.layer.shadowColor = UIColor.lightGray.cgColor
            cellC.contentView.layer.shadowOffset = CGSize(width:1.0,height: 3.0)
            cellC.contentView.layer.shadowRadius = 2.0
            cellC.contentView.layer.shadowOpacity = 1.0
            cellC.contentView.layer.masksToBounds = false;
            cellC.contentView.layer.shadowPath = UIBezierPath(roundedRect:cellC.bounds, cornerRadius:cellC.contentView.layer.cornerRadius).cgPath

            let storeInfo=storeviewModel.storeInfo(at:indexPath.item)
            cellC.update(info:storeInfo)
            
            return cellC
        } else {
            let cellD = collectionBest.dequeueReusableCell(withReuseIdentifier: "cellD", for: indexPath) as! CollectionViewBest
            
            let bestInfo=bestviewModel.bestInfo(at: indexPath.item)
            cellD.update(info:bestInfo)
            cellD.backgroundColor = .blue
            return cellD
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView==collectionStore{
            return UIEdgeInsets(top: 50, left: 0, bottom: 50, right: 0)
        }
        return UIEdgeInsets(top:5,left:5,bottom:5,right:5)
        }
    
    //셀이 선택되었을 때
    //func collectionView(_collectionView:UICollectionView, didSelectItemAt indexPath: IndexPath){
      //  print(indexPath.row)
    //}
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionBanner.topAnchor.constraint(equalTo: view.topAnchor,constant: 80).isActive=true
        collectionBanner.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 80).isActive=true
        collectionBanner.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -40).isActive=true
        collectionBanner.heightAnchor.constraint(equalTo: collectionBanner.widthAnchor,multiplier: 2.0).isActive=true
        collectionBanner.showsHorizontalScrollIndicator = false
        
    }
}
