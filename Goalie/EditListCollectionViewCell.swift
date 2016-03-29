//
//  EditListCollectionViewCell.swift
//  Goalie
//
//  Created by Gregory Klein on 3/28/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit

class EditListCollectionViewCell: UICollectionViewCell
{
   @IBOutlet private weak var _collectionView: UICollectionView!
   private var _option: EditListOption = .Characters
   
   override func awakeFromNib()
   {
      super.awakeFromNib()
      _collectionView.dataSource = self
   }
   
   func configureWithOption(option: EditListOption)
   {
      _option = option
      _collectionView.reloadData()
   }
}

extension EditListCollectionViewCell: UICollectionViewDataSource
{
   func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
   {
      switch _option {
      case .Characters: return _option.characters.count
      case .AccessoryPacks: return _option.accessoryPacks.count
      }
   }
   
   func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
   {
      switch _option {
      case .Characters:
         let identifier = "CharacterCellID"
         let cell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as! CharacterCollectionViewCell
         let character = _option.characters[indexPath.row]
         cell.configureWithCharacter(character)
         
         return cell
      case .AccessoryPacks:
         let identifier = "AccessoryPackCellID"
         let cell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as! AccessoryPackCollectionViewCell
         let accessoryPack = _option.accessoryPacks[indexPath.row]
         cell.configureWithAccessoryPack(accessoryPack)
         
         return cell
      }
   }
}
