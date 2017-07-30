//
//  CGFloat.swift
//  TeamworkTest
//
//  Created by Oscar Alvarez on 30/7/17.
//  Copyright © 2017 Oscar Alvarez. All rights reserved.
//

import UIKit

public extension CGFloat {
  
  public static func random(from lower: CGFloat = 0, to upper: CGFloat = 1) -> CGFloat {
    return CGFloat(Float(arc4random()) / Float(UINT32_MAX)) * (upper - lower) + lower
  }
}
