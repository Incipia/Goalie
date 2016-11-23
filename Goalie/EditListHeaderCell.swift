//
//  EditListHeaderCell.swift
//  Goalie
//
//  Created by Gregory Klein on 3/28/16.
//  Copyright © 2016 Incipia. All rights reserved.
//

import UIKit

class EditListHeaderCell: UICollectionReusableView
{
   @IBOutlet fileprivate weak var _titleLabel: UILabel!
   @IBOutlet fileprivate weak var _subtitleLabel: UILabel!
   
   func configureWithOption(_ option: EditListOption)
   {
      _titleLabel.text = option.title
      _subtitleLabel.text = option.subtitle
   }
}
