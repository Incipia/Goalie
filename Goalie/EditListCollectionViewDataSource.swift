//
//  EditListCollectionViewDataSource.swift
//  Goalie
//
//  Created by Gregory Klein on 3/28/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit

private let EditListCellIdentifier = "EditListCellID"
private let EditListHeaderCellID = "EditListHeaderCellID"

class EditListCollectionViewDataSource: NSObject
{
   private let _collectionView: UICollectionView
   private let _editListOptions: [EditListOption] = [.Characters, .AccessoryPacks]
   
   init(collectionView: UICollectionView)
   {
      _collectionView = collectionView
      super.init()
      
      let layout = UICollectionViewFlowLayout()
      layout.itemSize = CGSize(width: UIScreen.mainScreen().bounds.width, height: 150)
      layout.minimumInteritemSpacing = 0
      layout.minimumLineSpacing = 0
      layout.headerReferenceSize = CGSize(width: UIScreen.mainScreen().bounds.width, height: 110)
      
      _collectionView.collectionViewLayout = layout
      _collectionView.dataSource = self
   }
}

extension EditListCollectionViewDataSource: UICollectionViewDataSource
{
   func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int
   {
      return _editListOptions.count
   }
   
   func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
   {
      return 1
   }
   
   func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
   {
      let cell = collectionView.dequeueReusableCellWithReuseIdentifier(EditListCellIdentifier, forIndexPath: indexPath) as! EditListCollectionViewCell
      cell.backgroundColor = UIColor.redColor()
      
      return cell
   }
   
   func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView
   {
      switch kind {
         //2
      case UICollectionElementKindSectionHeader:
         //3
         let headerView =
         collectionView.dequeueReusableSupplementaryViewOfKind(kind,
            withReuseIdentifier: EditListHeaderCellID,
            forIndexPath: indexPath) as! EditListHeaderCell
         
         let option = _editListOptions[indexPath.section]
         headerView.configureWithOption(option)
         
         return headerView
      default:
         //4
         assert(false, "Unexpected element kind")
      }
      
      // This should not happen
      return collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "INVALID", forIndexPath: indexPath)
   }
}
