//
//  ProjectsViewController.swift
//  TeamworkTest
//
//  Created by Oscar Alvarez on 26/7/17.
//  Copyright © 2017 Oscar Alvarez. All rights reserved.
//

import UIKit

class ProjectsViewController: UIViewController {

  fileprivate var viewModel : ProjectListViewModel!
  
  @IBOutlet weak var errorLabel: UILabel!
  @IBOutlet weak var projectsCollectionView: UICollectionView!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

  override func viewDidLoad() {
    super.viewDidLoad()
    ProjectCell.register(with: projectsCollectionView)
    viewModel = ProjectListViewModel()
    title = ProjectsTitle.loading
    viewModel.loadProjects(completion: {[weak self] in
      self?.configureView()
    })
  }
  
  func configureView() {
    activityIndicator.stopAnimating()
    title = ProjectsTitle.projects
    if viewModel.projectsCount > 0 {
      projectsCollectionView.isHidden = false
      projectsCollectionView.reloadData()
    }
    else if viewModel.error != nil {
      projectsCollectionView.isHidden = true
      errorLabel.text = viewModel.error
    }
  }
  
}

extension ProjectsViewController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewModel.projectsCount
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let project = viewModel.project(at: indexPath.row)
    let cell = ProjectCell.dequeue(from: collectionView, for: indexPath, with: project)
    return cell
  }

}

extension ProjectsViewController: UICollectionViewDelegate{
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let project = viewModel.project(at: indexPath.row)
    let detailsViewModel = DetailsViewModel(with: project)
    let detailsViewController = DetailsViewController.fromStoryboard(with: detailsViewModel)
    navigationController?.pushViewController(detailsViewController, animated: true)
  }
  
}

extension ProjectsViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.bounds.width * 0.8, height: collectionView.bounds.width * 0.8 * (6/9))
  }
}
