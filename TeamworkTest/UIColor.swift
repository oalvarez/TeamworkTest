//
//  UIColor.swift
//  TeamworkTest
//
//  Created by Oscar Alvarez on 30/7/17.
//  Copyright © 2017 Oscar Alvarez. All rights reserved.
//

import UIKit

extension UIColor {
  
  convenience init(red r: CGFloat, green g: CGFloat, blue b: CGFloat) {
    self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
  }
  
  static var star: UIColor {
    return UIColor(red: 253, green: 187, blue: 40)
  }
  
  static var unstar: UIColor {
    return UIColor(red: 204, green: 204, blue: 204)
  }
  
  static var application: UIColor {
    return UIColor(red: 60, green: 85, blue: 116)
  }
  
  static var applicationDark: UIColor {
    return UIColor(red: 48, green: 68, blue: 93)
  }
  
  static var activeProject: UIColor {
    return UIColor(red: 234, green: 192, blue: 132)
  }
  
  static var currentProject: UIColor {
    return UIColor(red: 140, green: 193, blue: 248)
  }
  
  static var lateProject: UIColor {
    return UIColor(red: 217, green: 83, blue: 79)
  }
  
  static var noResponsable: UIColor {
    return UIColor(red: 238, green: 238, blue: 238)
  }
  
  static var responsable: UIColor {
    return UIColor(red: 223, green: 249, blue: 214)
  }
  
  static var priorityLow: UIColor {
    return UIColor(red: 115, green: 181, blue: 115)
  }
  
  static var priorityMedium: UIColor {
    return UIColor(red: 214, green: 183, blue: 59)
  }
  
  static var priorityHigh: UIColor {
    return UIColor(red: 198, green: 8, blue: 8)
  }
  
  static var priorityNone: UIColor {
    return UIColor(red: 238, green: 238, blue: 238)
  }
  
  static var observing: UIColor {
    return UIColor(red: 153, green: 153, blue: 153)
  }
  
  static var darkText: UIColor {
    return UIColor(red: 75, green: 75, blue: 75)
  }
  
  static var dueTimePassed: UIColor {
    return UIColor(red: 198, green: 8, blue: 8)
  }
  
  static func randomColor() -> UIColor {
    return UIColor(red:   .random(from: 0,to: 1),
                   green: .random(from: 0,to: 1),
                   blue:  .random(from: 0,to: 1),
                   alpha: 1.0)
  }
  
}
