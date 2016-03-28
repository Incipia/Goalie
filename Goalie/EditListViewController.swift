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
   @IBOutlet private weak var _doneButton: GoalieKerningButton! {
      didSet {
         _doneButton.layer.cornerRadius = 2.0
         _doneButton.backgroundColor = UIColor(priority: .Later)
      }
   }
   
   @IBOutlet private weak var _collectionView: UICollectionView!
   
   private var _collectionViewDataSource: EditListCollectionViewDataSource!
   
   override func viewDidLoad()
   {
      super.viewDidLoad()
      _collectionViewDataSource = EditListCollectionViewDataSource(collectionView: _collectionView)
   }
   
   @IBAction private func _doneButtonPressed()
   {
      dismissViewControllerAnimated(true, completion: nil)
      setNeedsStatusBarAppearanceUpdate()
   }
}
