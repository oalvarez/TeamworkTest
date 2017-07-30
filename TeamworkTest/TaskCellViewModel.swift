//
//  TaskCellViewModel.swift
//  TeamworkTest
//
//  Created by Oscar Alvarez on 30/7/17.
//  Copyright © 2017 Oscar Alvarez. All rights reserved.
//

import Foundation

struct TaskCellViewModel {
  private var task: Task
  
  var content: String { return task.content }
  var startDate: String? { return task.startDate?.display() }
  var dueDate: String? { return task.dueDate?.display() }
  var priorityString: String { return task.priority }
  var observing: Bool { return task.userFollowingChanges}
  var responsable: String { return task.responsablePartySummary }
  var priority: Task.Priority {
    switch task.priority {
    case TaskPriority.high:
      return .high
    case TaskPriority.medium:
      return .medium
    case TaskPriority.low:
      return .low
    default:
      return .unknown
    }
  }
    
  func timeFrame() -> String? {
    guard let start = startDate,
      let due = dueDate  else {
        return nil
    }
    return "[\(start) - \(due)]"
  }
  
  func dueDateHasPassed() -> Bool {
    guard let dueDate = task.dueDate else { return false }
    return dueDate < Date()
  }
  
  init(with task: Task) {
    self.task = task
  }
}

extension Task {
  enum Priority {
    case high
    case medium
    case low
    case unknown
  }
}
