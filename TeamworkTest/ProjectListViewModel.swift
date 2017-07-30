//
//  ProjectListViewModel.swift
//  TeamworkTest
//
//  Created by Oscar Alvarez on 29/7/17.
//  Copyright © 2017 Oscar Alvarez. All rights reserved.
//

import Foundation

typealias VoidBlock = ()->Void

class ProjectListViewModel {
  private var user = User()
  private var projects = [Project]()
  private var errorMessage : String?
  
  var networkLayer = NetworkLayer()
  
  func loadProjects(completion: @escaping VoidBlock) {
    networkLayer.fetchProjects(with: user.name, password: user.password) { [weak self] (projects, error) in
      if error != nil {
        self?.errorMessage = error?.localizedDescription ?? ErrorMessage.unknown
      }
      self?.projects = projects
      completion()
    }
  }
  
  var projectsCount: Int { return projects.count }
  var error: String? { return errorMessage }
  func project(at index: Int) -> Project { return projects[index] }
}
