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
   
   deinit {
      NSNotificationCenter.defaultCenter().removeObserver(self)
   }
   
   override func awakeFromNib()
   {
      super.awakeFromNib()
      _collectionView.dataSource = self
      _collectionView.delegate = self
      
      let notificationName = kMKStoreKitProductPurchasedNotification
      NSNotificationCenter.defaultCenter().addObserverForName(notificationName,
         object: nil, queue: NSOperationQueue.mainQueue()) { (note) -> Void in
            self._collectionView.reloadData()
      }
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
         let character = _option.characters[indexPath.row]
         return _cellForCharacter(character, indexPath: indexPath)
      case .AccessoryPacks:
         let accessoryPack = _option.accessoryPacks[indexPath.row]
         return _cellForAccessoryPack(accessoryPack, indexPath: indexPath)
      }
   }
   
   private func _cellForAccessoryPack(pack: AccessoryPack, indexPath: NSIndexPath) -> UICollectionViewCell
   {
      if AccessoryPackManager.accessoryPackUnlocked(pack) {
         let identifier = "UnlockedAccessoryPackCellID"
         let cell = _collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as! UnlockedAccessoryPackCollectionViewCell
         let accessoryPack = _option.accessoryPacks[indexPath.row]
         cell.configureWithAccessoryPack(accessoryPack)
         
         return cell
      }
      else {
         let identifier = "AccessoryPackCellID"
         let cell = _collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as! AccessoryPackCollectionViewCell
         let accessoryPack = _option.accessoryPacks[indexPath.row]
         
         cell.delegate = self
         cell.configureWithAccessoryPack(accessoryPack)
         
         return cell
      }
   }
   
   private func _cellForCharacter(character: GoalieCharacter, indexPath: NSIndexPath) -> UICollectionViewCell
   {
      if CharacterManager.characterUnlocked(character) {
         let identifier = "UnlockedCharacterCellID"
         let cell = _collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as! UnlockedCharacterCollectionViewCell
         cell.configureWithCharacter(character)
         return cell
      }
      else {
         let identifier = "CharacterCellID"
         let cell = _collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as! CharacterCollectionViewCell
         
         cell.delegate = self
         cell.configureWithCharacter(character)
         return cell
      }
   }
}

extension EditListCollectionViewCell: UICollectionViewDelegate
{
   func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
   {
      switch _option {
      case .Characters:
         let character = _option.characters[indexPath.row]
         guard CharacterManager.characterUnlocked(character) else { break }
         
         if CharacterManager.updateCurrentCharacter(character) {
            _collectionView.reloadData()
         }
      case .AccessoryPacks:
         let pack = _option.accessoryPacks[indexPath.row]
         guard AccessoryPackManager.accessoryPackUnlocked(pack) else { break }
         
         if AccessoryPackManager.updateCurrentAccessoryPack(pack) {
            _collectionView.reloadData()
         }
      }
      _collectionView.scrollToItemAtIndexPath(indexPath, atScrollPosition: .CenteredHorizontally, animated: true)
   }
}

extension EditListCollectionViewCell: EditListCharacterCellDelegate
{
   func actionButtonPressedForCharacter(character: GoalieCharacter)
   {
      if let action = character.unlockAction {
         switch action {
         case .Purchase(_, let id):
            MKStoreKit.sharedKit().initiatePaymentRequestForProductWithIdentifier(id)
         case .RateApp:
            _rateApp()
            CharacterManager.unlockCharacter(character)
         default: break
         }
      }
      _collectionView.reloadData()
   }
   
   private func _rateApp()
   {
      let appID = "1076725605"
      UIApplication.sharedApplication().openURL(NSURL(string : "itms-apps://itunes.apple.com/app/id\(appID)")!);
   }
}

extension EditListCollectionViewCell: AccessoryPackCollectionViewCellDelegate
{
   func actionButtonPressedForAccessoryPack(pack: AccessoryPack)
   {      
      if let action = pack.unlockAction {
         switch action {
         case .Purchase(_, let id):
            MKStoreKit.sharedKit().initiatePaymentRequestForProductWithIdentifier(id)
         default: break
         }
      }
      _collectionView.reloadData()
   }
}
