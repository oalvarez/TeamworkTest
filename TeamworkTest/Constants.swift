//
//  Constants.swift
//  TeamworkTest
//
//  Created by Oscar Alvarez on 30/7/17.
//  Copyright © 2017 Oscar Alvarez. All rights reserved.
//

import UIKit

enum AwesomeFontSize {
  static let small: CGFloat = 15
  static let medium: CGFloat = 20
  static let big: CGFloat = 30
}

enum Card {
  static let cornerRadius: CGFloat = 6
}

enum Storyboard {
  static let main: String = "Main"
}

enum Teamwork {
  static let projectsKey: String = "projects"
  static let tastksKey: String = "todo-items"
  static let baseUrl: String = "https://yat.teamwork.com" //For this demo we use a given user's site
  static let projectsUrl: String = "https://yat.teamwork.com/projects"
}

enum ErrorMessage {
  static let unknown: String = "Unknown Error"
}

enum TaskPriority {
  static let high: String = "high"
  static let medium: String = "medium"
  static let low: String = "low"
}

enum ProjectsTitle {
  static let loading: String = "Loading Projects..."
  static let projects: String = "Yat's Projects"
}

enum DetailsTitle {
  static let loading: String = "Loading Tasks..."
  static let projects: String = "Yat's Projects"
}

enum ImageName {
  static let placeholer: String = "placeholer"
}

enum Identifier {
  static let projectCell: String = "ProjectCell"
  static let detailsController: String = "DetailsViewController"
  static let taskCell: String = "TaskCell"
}

enum Responsable {
  static let anyone: String = "Anyone"
}

enum TaskKey {
  static let content: String = "content"
  static let responsibleSum: String = "responsible-party-summary"
  static let priority: String = "priority"
  static let following: String = "userFollowingChanges"
  static let startDate: String = "start-date"
  static let dueDate: String = "due-date"
}

enum ProjectKey {
  static let name: String = "name"
  static let description: String = "description"
  static let status: String = "status"
  static let subStatus: String = "subStatus"
  static let logo: String = "logo"
  static let id: String = "id"
  static let starred: String = "starred"
  static let tags: String = "tags"
  static let lastChanged: String = "last-changed-on"
  static let created: String = "created-on"
  static let company: String = "company"
}

enum CompanyKey {
  static let name: String = "name"
  static let id: String = "id"
  static let owner: String = "is-owner"
}











