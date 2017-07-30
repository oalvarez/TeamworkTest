//
//  ProjectCell.swift
//  TeamworkTest
//
//  Created by Oscar Alvarez on 27/7/17.
//  Copyright © 2017 Oscar Alvarez. All rights reserved.
//

import UIKit

class ProjectCell: UICollectionViewCell {

  @IBOutlet weak var logo: UIImageView!
  @IBOutlet weak var name: UILabel!
  @IBOutlet weak var star: UILabel!
  @IBOutlet weak var container: UIView! {
    didSet {
      container.layer.masksToBounds = true
      container.layer.cornerRadius = Card.cornerRadius
    }
  }
  
  fileprivate var modelView: ProjectCellViewModel!
  
}

//MARK: - Configure UI
extension ProjectCell {
  func configure(with modelView: ProjectCellViewModel) {
    set(name: modelView.name)
    set(logoImage: modelView.logoUrl)
    set(star: modelView.starred)
    }
  
  func set(name: String) {
    self.name.text = name
  }
  
  func set(logoImage withUrl: URL?) {
    guard let url = withUrl else {
      logo.image = UIImage(named: ImageName.placeholer)
      return
    }
    logo.af_setImage(withURL: url)
  }
  
  func set(star starred: Bool) {
    star.font = UIFont.fontAwesome(ofSize: AwesomeFontSize.medium)
    star.text = String.fontAwesomeIcon(name: .star)
    star.textColor = starred ? UIColor.star : UIColor.unstar
  }
}

//MARK: - Helper Methods
extension ProjectCell {
  public static var cellId: String {
    return Identifier.projectCell
  }
  
  public static var bundle: Bundle {
    return Bundle(for: ProjectCell.self)
  }
  
  public static var nib: UINib {
    return UINib(nibName: ProjectCell.cellId, bundle: ProjectCell.bundle)
  }
  
  public static func register(with collectionView: UICollectionView) {
    collectionView.register(ProjectCell.nib, forCellWithReuseIdentifier: ProjectCell.cellId)
  }
  
  public static func loadFromNib(owner: Any?) -> ProjectCell {
    return bundle.loadNibNamed(ProjectCell.cellId, owner: owner, options: nil)?.first as! ProjectCell
  }
  
  public static func dequeue(from collectionView: UICollectionView, for indexPath: IndexPath, with project: Project) -> ProjectCell {
    let projectCellViewModel = ProjectCellViewModel(with: project)
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProjectCell.cellId, for: indexPath) as! ProjectCell
    cell.configure(with: projectCellViewModel)
    return cell
  }
}
