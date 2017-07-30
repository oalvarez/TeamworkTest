//
//  DetailsViewModel.swift
//  TeamworkTest
//
//  Created by Oscar Alvarez on 29/7/17.
//  Copyright © 2017 Oscar Alvarez. All rights reserved.
//

import Foundation

class DetailsViewModel {
  private var project: Project
  private var tasks = [Task]()
  
  private var user = User()
  private var networkLayer = NetworkLayer()
  private var errorMessage : String?
  
  var name: String { return project.name }
  var description: String { return project.description }
  var logoUrl: URL? { return URL(string: project.logoUrl) }
  var createdOn: String? { return project.createdOn?.display() }
  var lastChangedOn: String? { return project.lastChangedOn?.display() }
  var companyName: String { return project.company.name }
  var starred: Bool { return project.starred }
  var status: String { return project.status.uppercased() }
  var subStatus: String { return project.subStatus.uppercased() }
  var error: String? { return errorMessage }
  var tasksCount: Int { return tasks.count }
  func task(at index: Int) -> Task { return tasks[index] }
  
  init(with project: Project) {
    self.project = project
  }
  
  func loadTasks(completion: @escaping VoidBlock) {
    networkLayer.fetchTasks(with: user.name, password: user.password, projectId: project.id) {[weak self] (tasks, error) in
      if error != nil {
        self?.errorMessage = error?.localizedDescription ?? ErrorMessage.unknown
      }
      self?.tasks = tasks
      completion()
    }

  }

}
