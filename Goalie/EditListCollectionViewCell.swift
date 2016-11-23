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
   @IBOutlet fileprivate weak var _collectionView: UICollectionView!
   
   fileprivate var _option: EditListOption = .Characters
   fileprivate var _initialPositionSetFlag = false
   
   deinit {
      NotificationCenter.default.removeObserver(self)
   }
   
   override func awakeFromNib()
   {
      super.awakeFromNib()
      _collectionView.dataSource = self
      _collectionView.delegate = self
      
      let notificationName = NSNotification.Name.mkStoreKitProductPurchased
      NotificationCenter.default.addObserver(forName: notificationName,
         object: nil, queue: OperationQueue.main) { (note) -> Void in
            self._collectionView.reloadData()
      }
      
      // Ran out of options... I'll figure out a better way to make this happen at some point or another.
      let delayTime = DispatchTime.now() + Double(Int64(0.01 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
      DispatchQueue.main.asyncAfter(deadline: delayTime) {
         self.scrollToOption()
      }
   }
   
   func configureWithOption(_ option: EditListOption)
   {
      _option = option
      _collectionView.reloadData()
   }
   
   func scrollToOption()
   {
      switch _option {
      case .Characters:
         let current = CharacterManager.currentCharacter
         if let index = _option.characters.index(of: current) {
            let indexPath = IndexPath(row: index, section: 0)
            _collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
         }
      case .AccessoryPacks:
         let current = AccessoryPackManager.currentAccessoryPack
         if let index = _option.accessoryPacks.index(of: current) {
            let indexPath = IndexPath(row: index, section: 0)
            _collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
         }
      }
   }
}

extension EditListCollectionViewCell: UICollectionViewDataSource
{
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
   {
      switch _option {
      case .Characters: return _option.characters.count
      case .AccessoryPacks: return _option.accessoryPacks.count
      }
   }
   
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
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
   
   fileprivate func _cellForAccessoryPack(_ pack: AccessoryPack, indexPath: IndexPath) -> UICollectionViewCell
   {
      if AccessoryPackManager.accessoryPackUnlocked(pack) {
         let identifier = "UnlockedAccessoryPackCellID"
         let cell = _collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! UnlockedAccessoryPackCollectionViewCell
         let accessoryPack = _option.accessoryPacks[indexPath.row]
         cell.configureWithAccessoryPack(accessoryPack)
         
         return cell
      }
      else {
         let identifier = "AccessoryPackCellID"
         let cell = _collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! AccessoryPackCollectionViewCell
         let accessoryPack = _option.accessoryPacks[indexPath.row]
         
         cell.delegate = self
         cell.configureWithAccessoryPack(accessoryPack)
         
         return cell
      }
   }
   
   fileprivate func _cellForCharacter(_ character: GoalieCharacter, indexPath: IndexPath) -> UICollectionViewCell
   {
      if CharacterManager.characterUnlocked(character) {
         let identifier = "UnlockedCharacterCellID"
         let cell = _collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! UnlockedCharacterCollectionViewCell
         cell.configureWithCharacter(character)
         return cell
      }
      else {
         let identifier = "CharacterCellID"
         let cell = _collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! CharacterCollectionViewCell
         
         cell.delegate = self
         cell.configureWithCharacter(character)
         return cell
      }
   }
}

extension EditListCollectionViewCell: UICollectionViewDelegate
{
   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
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
      _collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
   }
}

extension EditListCollectionViewCell: EditListCharacterCellDelegate
{
   func actionButtonPressedForCharacter(_ character: GoalieCharacter)
   {
      if let action = character.unlockAction {
         switch action {
         case .purchase(_, let id):
            MKStoreKit.shared().initiatePaymentRequestForProduct(withIdentifier: id)
         case .rateApp:
            _rateApp()
            CharacterManager.unlockCharacter(character)
            let delayTime = DispatchTime.now() + Double(Int64(Double(2) * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
            DispatchQueue.main.asyncAfter(deadline: delayTime) {
               self._collectionView.reloadData()
            }
         default: break
         }
      }
   }
   
   fileprivate func _rateApp()
   {
      let appID = "1076725605"
      UIApplication.shared.openURL(URL(string : "itms-apps://itunes.apple.com/app/id\(appID)")!);
   }
}

extension EditListCollectionViewCell: AccessoryPackCollectionViewCellDelegate
{
   func actionButtonPressedForAccessoryPack(_ pack: AccessoryPack)
   {      
      if let action = pack.unlockAction {
         switch action {
         case .purchase(_, let id):
            MKStoreKit.shared().initiatePaymentRequestForProduct(withIdentifier: id)
         default: break
         }
      }
      _collectionView.reloadData()
   }
}
