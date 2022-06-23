//
//  FavoriteViewController.swift
//  Luni_App
//
//  Created by Boubakar Traore on 21/06/2022.
//

import UIKit
import SnapKit

class FavoriteViewController: UIViewController {
    
    // MARK: - Properties
    
    /// View Model
    let meditations = FavoriteMeditations.init()
    
    let topImageCollapsable =  UIImageView()
    var favoriteTableView = UITableView()
    var titleLabel = UILabel()
    var courseLabel = UILabel()
    var descriptionLabel = UILabel()
    var backButtonImage = UIImage()
    
    /// Views
    var headerView = UIView()
    var separatorView = UIView()
    
    /// View properties
    let maxHeaderHeight: CGFloat = 350
    let minHeaderHeight: CGFloat = 80
    var previousScrollOffset: CGFloat = 0
    
    /// Constraints
    var headerViewHeight: NSLayoutConstraint!
    var constraints = [NSLayoutConstraint]()
    
    
    // MARK: - Birth and Death
    
    override func loadView() {
        super.loadView()
        
        // Header View
        self.view.addSubview(self.headerView)
        self.headerView.translatesAutoresizingMaskIntoConstraints = false
        self.constraints.append(self.headerView.topAnchor.constraint(equalTo: self.view.topAnchor))
        self.constraints.append(self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor))
        self.constraints.append(self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor))
        self.headerViewHeight = self.headerView.heightAnchor.constraint(equalToConstant: 350)
        self.headerViewHeight.isActive = true
        
        // Image at the top
        self.headerView.addSubview(self.topImageCollapsable)
        self.topImageCollapsable.translatesAutoresizingMaskIntoConstraints = false
        self.constraints.append(self.topImageCollapsable.topAnchor.constraint(equalTo: self.headerView.topAnchor))
        self.constraints.append(self.topImageCollapsable.leadingAnchor.constraint(equalTo: self.headerView.leadingAnchor))
        self.constraints.append(self.topImageCollapsable.trailingAnchor.constraint(equalTo: self.headerView.trailingAnchor))
        
        // Favorite Title View
        self.headerView.addSubview(self.titleLabel)
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.constraints.append(self.titleLabel.topAnchor.constraint(equalTo: self.topImageCollapsable.bottomAnchor, constant: 50))
        self.constraints.append(self.titleLabel.leadingAnchor.constraint(equalTo: self.headerView.leadingAnchor, constant: 20))
        self.constraints.append(self.titleLabel.trailingAnchor.constraint(equalTo: self.headerView.trailingAnchor, constant: -20))
        
        // Favorite Course View
        self.headerView.addSubview(self.courseLabel)
        self.courseLabel.translatesAutoresizingMaskIntoConstraints = false
        self.constraints.append(self.courseLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 5))
        self.constraints.append(self.courseLabel.leadingAnchor.constraint(equalTo: self.headerView.leadingAnchor, constant: 20))
        self.constraints.append(self.courseLabel.trailingAnchor.constraint(equalTo: self.headerView.trailingAnchor, constant: -20))
        
        // Favorite Description View
        self.headerView.addSubview(self.descriptionLabel)
        self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.constraints.append(self.descriptionLabel.topAnchor.constraint(equalTo: self.courseLabel.bottomAnchor, constant: 25))
        self.constraints.append(self.descriptionLabel.leadingAnchor.constraint(equalTo: self.headerView.leadingAnchor, constant: 20))
        self.constraints.append(self.descriptionLabel.trailingAnchor.constraint(equalTo: self.headerView.trailingAnchor, constant: -20))
        
        // Favorite Separator View
        self.headerView.addSubview(self.separatorView)
        self.separatorView.translatesAutoresizingMaskIntoConstraints = false
        self.constraints.append(self.separatorView.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 20))
        self.constraints.append(self.separatorView.leadingAnchor.constraint(equalTo: self.headerView.leadingAnchor, constant: 20))
        self.constraints.append(self.separatorView.trailingAnchor.constraint(equalTo: self.headerView.trailingAnchor, constant: -20))
        self.constraints.append(self.separatorView.heightAnchor.constraint(equalToConstant: 1))
        
        // Favorite TableView
        self.view.addSubview(self.favoriteTableView)
        self.favoriteTableView.translatesAutoresizingMaskIntoConstraints = false
        self.constraints.append(self.favoriteTableView.topAnchor.constraint(equalTo: self.headerView.bottomAnchor, constant: 20))
        self.constraints.append(self.favoriteTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor))
        self.constraints.append(self.favoriteTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor))
        self.constraints.append(self.favoriteTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor))
        
        NSLayoutConstraint.activate(self.constraints)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Favorite View
        self.view.backgroundColor = UIColor(red: 255/255, green: 147/255, blue: 150/255, alpha: 1)
        
        // Top Image Collapsable
        self.topImageCollapsable.image = UIImage(named: "FavoriteTopImage")
        self.topImageCollapsable.contentMode = .scaleToFill
        
        // Title label
        self.titleLabel.text = meditations.title
        self.titleLabel.textColor = .white
        self.titleLabel.font = UIFont(name: "Gilroy-ExtraBold", size: 30)
        
        // Course Label
        self.courseLabel.text = "\(meditations.courseNumber) Courses"
        self.courseLabel.textColor = .white
        self.courseLabel.font = UIFont(name: "Gilroy-ExtraBold", size: 15)
        
        // Description Label
        self.descriptionLabel.text = meditations.description
        self.descriptionLabel.textColor = .white
        self.descriptionLabel.font = UIFont(name: "Gilroy-Light", size: 15)
        self.descriptionLabel.numberOfLines = 0
        
        // Separator View
        self.separatorView.backgroundColor = .white
        
        // TableView
        self.favoriteTableView.separatorStyle = .none
        self.favoriteTableView.backgroundColor = UIColor(red: 255/255, green: 147/255, blue: 150/255, alpha: 1)
        self.favoriteTableView.dataSource = self
        self.favoriteTableView.delegate = self
        self.favoriteTableView.register(FavoriteCustomCell.self, forCellReuseIdentifier: FavoriteCustomCell.identifier)
        self.favoriteTableView.rowHeight = 50
        
        // Back Button
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", image: UIImage(named: "BackButton"))
        
    }
    
}

// MARK: - TableView

extension FavoriteViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meditations.meditationsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentMeditation = meditations.meditationsList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteCustomCell.identifier, for: indexPath) as! FavoriteCustomCell
        cell.configure(title: currentMeditation.title, level: currentMeditation.level, status: currentMeditation.favorite)
        
        return cell
        
    }
    
}

// MARK: - Collapsing functions

extension FavoriteViewController {
    
    func canAnimateHeader (_ scrollView: UIScrollView) -> Bool {
        let scrollViewMaxHeight = scrollView.frame.height + self.headerViewHeight.constant - minHeaderHeight
        return scrollView.contentSize.height > scrollViewMaxHeight
    }
    func setScrollPosition() {
        self.favoriteTableView.contentOffset = CGPoint(x:0, y: 0)
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollDiff = (scrollView.contentOffset.y - previousScrollOffset)
        let isScrollingDown = scrollDiff > 0
        let isScrollingUp = scrollDiff < 0
        if canAnimateHeader(scrollView) {
            var newHeight = self.headerViewHeight.constant
            if isScrollingDown {
                newHeight = max(minHeaderHeight, self.headerViewHeight.constant - abs(scrollDiff))
            } else if isScrollingUp {
                newHeight = min(maxHeaderHeight, self.headerViewHeight.constant + abs(scrollDiff))
            }
            if newHeight != self.headerViewHeight.constant {
                self.headerViewHeight.constant = newHeight
                setScrollPosition()
                previousScrollOffset = scrollView.contentOffset.y
            }
            if newHeight == self.minHeaderHeight {
                self.topImageCollapsable.isHidden = true
                self.navigationItem.title = "Favorite meditations"
                
            } else {
                self.topImageCollapsable.isHidden = false
                self.navigationItem.title = ""
            }
        }
    }
    
}
