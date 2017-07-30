//
//  APIService.swift
//  TeamworkTest
//
//  Created by Oscar Alvarez on 29/7/17.
//  Copyright © 2017 Oscar Alvarez. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkLayer {
  func fetchProjects(with userName: String,
                            password: String,
                            completion: @escaping ([Project], Error?) -> ()) {
    
    let credentialData = "\(userName):\(password)".data(using: String.Encoding.utf8)!
    let base64Credentials = credentialData.base64EncodedString(options: [])
    let headers = ["Authorization": "Basic \(base64Credentials)"]
    
    Alamofire.request("\(Teamwork.baseUrl)/projects.json", headers:headers)
      .validate()
      .responseJSON { response in
        if let json = response.result.value {
          
          let projects = JSON(json)[Teamwork.projectsKey].arrayValue.map {
            Project(with:$0.dictionaryValue as Dictionary<String, AnyObject>)
          }
          completion(projects, response.error)
        } else {
          completion([], response.error)
        }
    }
  }
  
  func fetchTasks(with userName: String,
                       password: String,
                       projectId: String,
                       completion: @escaping ([Task], Error?) -> ()) {
    
    let credentialData = "\(userName):\(password)".data(using: String.Encoding.utf8)!
    let base64Credentials = credentialData.base64EncodedString(options: [])
    let headers = ["Authorization": "Basic \(base64Credentials)"]
    
    Alamofire.request("\(Teamwork.projectsUrl)/\(projectId)/tasks.json", headers:headers)
      .validate()
      .responseJSON { response in
        if let json = response.result.value {
          
          let tasks = JSON(json)[Teamwork.tastksKey].arrayValue.map {
            Task(with:$0.dictionaryValue as Dictionary<String, AnyObject>)
          }
          completion(tasks, response.error)
        } else {
          completion([], response.error)
        }
    }
  }
}
