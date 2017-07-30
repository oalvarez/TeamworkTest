//
//  TaskCell.swift
//  TeamworkTest
//
//  Created by Oscar Alvarez on 30/7/17.
//  Copyright © 2017 Oscar Alvarez. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {
  
  @IBOutlet weak var timeFrame: UILabel!
  @IBOutlet weak var priority: UILabel!
  @IBOutlet weak var observing: UILabel!
  @IBOutlet weak var content: UILabel!
  @IBOutlet weak var responsable: UILabel! {
    didSet {
      responsable.layer.masksToBounds = true
      responsable.layer.cornerRadius = 3
    }
  }
  
}

//MARK: - Configure UI
extension TaskCell {
  func configure(with modelView: TaskCellViewModel) {
    set(responsable: modelView.responsable)
    set(timeFrame: modelView.timeFrame(), passed: modelView.dueDateHasPassed())
    set(priority: modelView.priority)
    set(observing: modelView.observing)
    set(content: modelView.content)
  }
  
  func set(responsable: String) {
    if responsable.isEmpty {
      self.responsable.text = Responsable.anyone
      self.responsable.backgroundColor = UIColor.noResponsable
    } else {
      self.responsable.backgroundColor = UIColor.responsable
    }
    self.responsable.textColor = UIColor.darkText
  }
  
  func set(timeFrame text: String?, passed: Bool) {
    guard let text = text else {
        self.timeFrame.isHidden = true
        return
    }
    self.timeFrame.text = text
    self.timeFrame.textColor = passed ? UIColor.dueTimePassed : UIColor.darkText
  }
  
  func set(priority: Task.Priority) {
    var color = UIColor.application
    switch priority {
    case .high:
      color = UIColor.priorityHigh
    case .medium:
      color = UIColor.priorityMedium
    case .low:
      color = UIColor.priorityLow
    case .unknown:
      color = UIColor.priorityNone
    }
    
    self.priority.font = UIFont.fontAwesome(ofSize: 20)
    self.priority.text = String.fontAwesomeIcon(name: .exclamationCircle)
    self.priority.textColor = color
  }
  
  func set(observing: Bool) {
    self.observing.isHidden = !observing
    self.observing.font = UIFont.fontAwesome(ofSize: 20) //TODO: Avoid hardcoding
    self.observing.text = String.fontAwesomeIcon(name: .eye)
    self.observing.textColor = UIColor.observing
  }
  
  func set(content: String) {
    self.content.text = content
    self.content.textColor = UIColor.darkText
  }
}

//MARK: - Helper Methods
extension TaskCell {
  public static var cellId: String {
    return Identifier.taskCell
  }
  
  public static var bundle: Bundle {
    return Bundle(for: TaskCell.self)
  }
  
  public static var nib: UINib {
    return UINib(nibName: TaskCell.cellId, bundle: TaskCell.bundle)
  }
  
  public static func register(with tableView: UITableView) {
    tableView.register(TaskCell.nib, forCellReuseIdentifier: TaskCell.cellId)
  }
  
  public static func loadFromNib(owner: Any?) -> TaskCell {
    return bundle.loadNibNamed(TaskCell.cellId, owner: owner, options: nil)?.first as! TaskCell
  }
  
  public static func dequeue(from tableView: UITableView, for indexPath: IndexPath, with task: Task) -> TaskCell {
    let taskCellViewModel = TaskCellViewModel(with: task)
    let cell = tableView.dequeueReusableCell(withIdentifier: TaskCell.cellId, for: indexPath) as! TaskCell
    cell.configure(with: taskCellViewModel)
    return cell
  }
}
