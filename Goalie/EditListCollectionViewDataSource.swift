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
      layout.itemSize = CGSize(width: UIScreen.mainScreen().bounds.width, height: 200)
      layout.minimumInteritemSpacing = 0
      layout.minimumLineSpacing = 0
      layout.headerReferenceSize = CGSize(width: UIScreen.mainScreen().bounds.width, height: 80)
      layout.footerReferenceSize = CGSize(width: UIScreen.mainScreen().bounds.width, height: 30)
      
      _collectionView.collectionViewLayout = layout
      _collectionView.dataSource = self
      _collectionView.delegate = self
   }
   
   func updateScrollPositionsForCurrentCharacterAndAccessoryPack()
   {
      for cell in _collectionView.visibleCells() {
         guard let editListCell = cell as? EditListCollectionViewCell else { continue }
         editListCell.scrollToOption()
      }
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
      
      let option = _editListOptions[indexPath.section]
      cell.configureWithOption(option)
      
      return cell
   }
   
//   func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath)
//   {
//      let cell = collectionView.dequeueReusableCellWithReuseIdentifier(EditListCellIdentifier, forIndexPath: indexPath) as! EditListCollectionViewCell
//      
//      let option = _editListOptions[indexPath.section]
//      switch option {
//      case .Characters:
//         let current = CharacterManager.currentCharacter
//         if let index = option.characters.indexOf(current) {
//            let indexPath = NSIndexPath(forRow: index, inSection: 0)
//            cell.scrollToItemAtIndexPath(indexPath)
//         }
//      case .AccessoryPacks:
//         let current = AccessoryPackManager.currentAccessoryPack
//         if let index = option.accessoryPacks.indexOf(current) {
//            let indexPath = NSIndexPath(forRow: index, inSection: 0)
//            cell.scrollToItemAtIndexPath(indexPath)
//         }
//      }
//   }
   
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
         //2
      case UICollectionElementKindSectionFooter:
         //3
         let headerView =
         collectionView.dequeueReusableSupplementaryViewOfKind(kind,
            withReuseIdentifier: "EditListFooterCellID",
            forIndexPath: indexPath)
         return headerView
         
         
      default:
         //4
         assert(false, "Unexpected element kind")
      }
      
      // This should not happen
      return collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "INVALID", forIndexPath: indexPath)
   }
}

extension EditListCollectionViewDataSource: UICollectionViewDelegate
{
   func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize
   {
      let width: CGFloat = UIScreen.mainScreen().bounds.width
      let height: CGFloat = section == 0 ? 110 : 80
      
      return CGSize(width: width, height: height)
   }
}
