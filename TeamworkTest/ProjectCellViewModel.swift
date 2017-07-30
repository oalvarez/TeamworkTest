//
//  ProjectCellViewModel.swift
//  TeamworkTest
//
//  Created by Oscar Alvarez on 30/7/17.
//  Copyright © 2017 Oscar Alvarez. All rights reserved.
//

import Foundation

struct ProjectCellViewModel {
  private var project: Project
  
  var logoUrl: URL? { return URL(string: project.logoUrl) }
  var name: String { return project.name }
  var starred: Bool { return project.starred }
  
  init(with project: Project) {
    self.project = project
  }
}
