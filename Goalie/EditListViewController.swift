//
//  EditListViewController.swift
//  Goalie
//
//  Created by Gregory Klein on 3/27/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit

class EditListViewController: UIViewController
{
   @IBOutlet fileprivate weak var _doneButton: GoalieKerningButton! {
      didSet {
         _doneButton.layer.cornerRadius = 2.0
         _doneButton.backgroundColor = UIColor(priority: .later)
      }
   }
   
   @IBOutlet fileprivate weak var _collectionView: UICollectionView!
   
   fileprivate var _collectionViewDataSource: EditListCollectionViewDataSource!
   
   override func viewDidLoad()
   {
      super.viewDidLoad()
      _collectionViewDataSource = EditListCollectionViewDataSource(collectionView: _collectionView)
   }
   
   @IBAction fileprivate func _doneButtonPressed()
   {
      dismiss(animated: true, completion: nil)
      setNeedsStatusBarAppearanceUpdate()
   }
   
   @IBAction fileprivate func _restoreButtonPressed()
   {
      MKStoreKit.shared().restorePurchases()
   }
}
