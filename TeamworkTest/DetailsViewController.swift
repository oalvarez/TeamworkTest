
//
//  DetailsViewController.swift
//  TeamworkTest
//
//  Created by Oscar Alvarez on 28/7/17.
//  Copyright © 2017 Oscar Alvarez. All rights reserved.
//

import UIKit
import AlamofireImage
import FontAwesome_swift

class DetailsViewController: UIViewController {

  enum DescriptionPresentationStatus {
    case fully
    case partially
  }
  
  @IBOutlet weak var infoLabel: UILabel!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  @IBOutlet weak var projectDescription: UILabel!
  @IBOutlet weak var logo: UIImageView!
  @IBOutlet weak var star: UIButton!
  @IBOutlet weak var createdOn: UILabel!
  @IBOutlet weak var lastChangedOn: UILabel!
  @IBOutlet weak var status: UILabel!
  @IBOutlet weak var subStatus: UILabel!
  @IBOutlet weak var tasksTableView: UITableView! {
    didSet {
      tasksTableView.rowHeight = UITableViewAutomaticDimension
      tasksTableView.estimatedRowHeight = 80
    }
  }
  
  fileprivate var viewModel: DetailsViewModel!
  
  //MARK: - Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    TaskCell.register(with: tasksTableView)
    setupView()
    viewModel.loadTasks(completion: {[weak self] in
      guard let strongSelf = self else { return }
      strongSelf.configureView()
    })
  }
  
  func configureView() {
    
    activityIndicator.stopAnimating()
    title = "\(viewModel.companyName.capitalized)'s \(viewModel.name.capitalized)"
    tasksTableView.reloadData()
    if viewModel.tasksCount > 0 {
      tasksTableView.isHidden = false
    } else {
      infoLabel.isHidden = false
      if viewModel.error != nil {
        infoLabel.text = viewModel.error
      }
    }
  
  }

  //MARK: - Configuration
  func configure(with viewModel: DetailsViewModel) {
    self.viewModel = viewModel
  }
  
  //MARK: - Description Presentation UX
  @IBOutlet var descriptionHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var showMoreButton: UIButton!{
    didSet {
      showMoreButton.titleLabel?.font = UIFont.fontAwesome(ofSize: AwesomeFontSize.big)
      showMoreButton.setTitle(String.fontAwesomeIcon(name: .angleDown), for: .normal)
    }
  }
  
  @IBAction func showMore(_ sender: UIButton) {
    descriptionPresentation = (descriptionPresentation == .partially) ? .fully : .partially
  }
  
  var descriptionPresentation = DescriptionPresentationStatus.partially {
    didSet { performDescriptionPresentation() }
  }
  
  func performDescriptionPresentation() {
    switch descriptionPresentation {
    case .partially:
      descriptionHeightConstraint.isActive = true
      showMoreButton.setTitle(String.fontAwesomeIcon(name: .angleDown), for: .normal)
    case .fully:
      descriptionHeightConstraint.isActive = false
      showMoreButton.setTitle(String.fontAwesomeIcon(name: .angleUp), for: .normal)
    }
    UIView.animate(withDuration: 0.3) {
      self.view.layoutIfNeeded()
    }
  }

}

//MARK: - Setup Data into the View
extension DetailsViewController {
  func setupView() {
    
    setTitle()
    setDescription()
    setLogo()
    setStar()
    setCreated()
    setChanged()
    setStatus()
    setSubstatus()
  }
  
  func setTitle() {
    title = DetailsTitle.loading
  }
  
  func setDescription() {
    projectDescription.text = viewModel.description
    projectDescription.textColor = UIColor.applicationDark
  }
  
  func setLogo() {
    guard let url = viewModel.logoUrl else {
      logo.image = UIImage(named: ImageName.placeholer)
      return
    }
    logo.af_setImage(withURL: url)
  }
  
  func setStar() {
    star.titleLabel?.font = UIFont.fontAwesome(ofSize: AwesomeFontSize.big)
    star.setTitle(String.fontAwesomeIcon(name: .star), for: .normal)
    star.setTitleColor(viewModel.starred ? UIColor.star : UIColor.unstar, for: .normal)
  }
  
  func setCreated() {
    guard let created = viewModel.createdOn else {
      createdOn.isHidden = true
      return
    }
    createdOn.text = "Created: \(created)"
    createdOn.textColor = UIColor.applicationDark
  }
  
  func setChanged() {
    guard let changed = viewModel.lastChangedOn else {
      lastChangedOn.isHidden = true
      return
    }
    lastChangedOn.text = "Changed: \(changed)"
    lastChangedOn.textColor = UIColor.applicationDark
  }
  
  func setStatus() {
    status.text = viewModel.status
    status.textColor =  UIColor.activeProject
  }
  
  func setSubstatus() {
    subStatus.text = viewModel.subStatus
    subStatus.textColor = viewModel.subStatus == "LATE" ? UIColor.lateProject : UIColor.currentProject
  }

}

//MARK: - Data Source
extension DetailsViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.tasksCount
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let task = viewModel.task(at: indexPath.row)
    let cell = TaskCell.dequeue(from: tableView, for: indexPath, with: task)
    return cell
  }
  
}

//MARK: - Helper Methods
extension DetailsViewController {
  public static var identifier: String {
    return Identifier.detailsController
  }
  
  static func fromStoryboard(with viewModel: DetailsViewModel) -> DetailsViewController {
    let viewController = UIStoryboard.main.instantiateViewController(withIdentifier: DetailsViewController.identifier) as! DetailsViewController
    viewController.configure(with: viewModel)
    return viewController
  }
}
