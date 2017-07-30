//
//  Task.swift
//  TeamworkTest
//
//  Created by Oscar Alvarez on 30/7/17.
//  Copyright © 2017 Oscar Alvarez. All rights reserved.
//

import Foundation

import SwiftyJSON

struct Task {
  
  var content: String
  var responsablePartySummary: String
  var userFollowingChanges: Bool
  var startDate: Date?
  var dueDate: Date?
  var priority: String
  
  init(with data: Dictionary <String, AnyObject>) {
    let json = JSON(jsonObject: data)
    content = json[TaskKey.content].stringValue
    responsablePartySummary = json[TaskKey.responsibleSum].stringValue
    priority = json[TaskKey.priority].stringValue
    
    userFollowingChanges = json[TaskKey.following].boolValue
    
    startDate = Date.from(string: json[TaskKey.startDate].stringValue)
    dueDate = Date.from(string: json[TaskKey.dueDate].stringValue)
  }
}
