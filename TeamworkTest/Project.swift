//
//  Project.swift
//  TeamworkTest
//
//  Created by Oscar Alvarez on 26/7/17.
//  Copyright © 2017 Oscar Alvarez. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Project {
  
  var name: String
  var description: String
  var startDate: Date = Date()
  var endDate: Date = Date()
  var starred: Bool
  var status: String
  var subStatus: String
  var createdOn: Date?
  var lastChangedOn: Date?
  
  var logoUrl: String
  var id: String
  var tags: [String]
  
  var company: Company
  
  init(with data: Dictionary <String, AnyObject>) {
    let json = JSON(jsonObject: data)
    name = json[ProjectKey.name].stringValue
    description = json[ProjectKey.description].stringValue
    status = json[ProjectKey.status].stringValue
    subStatus = json[ProjectKey.subStatus].stringValue
    logoUrl = json[ProjectKey.logo].stringValue
    id = json[ProjectKey.id].stringValue
    starred = json[ProjectKey.starred].boolValue
    tags = json[ProjectKey.tags].arrayValue.map{ $0.stringValue }
    lastChangedOn = Date.from(string: json[ProjectKey.lastChanged].stringValue)
    createdOn = Date.from(string: json[ProjectKey.created].stringValue)
    
    company = Company(with: json[ProjectKey.company].dictionaryValue as Dictionary<String, AnyObject>)

  }
  
}

struct Company {
  var name: String
  var id: String
  var isOwner: Bool
  
  init(with data: Dictionary <String, AnyObject>) {
    let json = JSON(jsonObject: data)
    name = json[CompanyKey.name].stringValue
    id = json[CompanyKey.id].stringValue
    isOwner = json[CompanyKey.owner].boolValue
  }

}

