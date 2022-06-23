//
//  ViewController.swift
//  Luni_App
//
//  Created by Boubakar Traore on 20/06/2022.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: Properties
    
    let favoriteButtonView = UIView()
    let favoriteButtonTitle =  UILabel()
    let favoriteButtonCourse = UILabel()
    let favoriteButtonIcon = UIImageView()
    let favoriteButtonSubView = UIView()
    
    /// Array of view constraints
    var constraint = [NSLayoutConstraint]()
    
    /// ViewModel
    let homeViewModel = HomeViewModel()
    
    // MARK: Birth and Death
    
    override func loadView() {
        super.loadView()
        
        // Favorited Card View
        self.view.addSubview(self.favoriteButtonView)
        self.favoriteButtonView.translatesAutoresizingMaskIntoConstraints = false
        self.constraint.append(self.favoriteButtonView.widthAnchor.constraint(equalToConstant: 300))
        self.constraint.append(self.favoriteButtonView.heightAnchor.constraint(equalToConstant: 150))
        self.constraint.append(self.favoriteButtonView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor))
        self.constraint.append(self.favoriteButtonView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100))
        
        // Favorite Stack View
        self.favoriteButtonView.addSubview(self.favoriteButtonSubView)
        self.favoriteButtonSubView.translatesAutoresizingMaskIntoConstraints = false
        self.constraint.append(self.favoriteButtonSubView.leadingAnchor.constraint(equalTo: self.favoriteButtonView.leadingAnchor, constant: 10))
        self.constraint.append(self.favoriteButtonSubView.trailingAnchor.constraint(equalTo: self.favoriteButtonView.trailingAnchor, constant: -10))
        self.constraint.append(self.favoriteButtonSubView.bottomAnchor.constraint(equalTo: self.favoriteButtonView.bottomAnchor, constant: -10))
        
        // Favorite Title View
        self.favoriteButtonSubView.addSubview(self.favoriteButtonTitle)
        self.favoriteButtonTitle.translatesAutoresizingMaskIntoConstraints = false
        self.constraint.append(self.favoriteButtonTitle.leadingAnchor.constraint(equalTo: self.favoriteButtonSubView.leadingAnchor, constant: 5))
        self.constraint.append(self.favoriteButtonTitle.topAnchor.constraint(equalTo: self.favoriteButtonSubView.topAnchor, constant: 5))
        
        // Favoire Courses View
        self.favoriteButtonSubView.addSubview(self.favoriteButtonCourse)
        self.favoriteButtonCourse.translatesAutoresizingMaskIntoConstraints = false
        self.constraint.append(self.favoriteButtonCourse.topAnchor.constraint(equalTo: self.favoriteButtonTitle.bottomAnchor, constant: -5))
        self.constraint.append(self.favoriteButtonCourse.leadingAnchor.constraint(equalTo: self.favoriteButtonSubView.leadingAnchor, constant: 5))
        
        // Favorite Icon View
        self.favoriteButtonSubView.addSubview(self.favoriteButtonIcon)
        self.favoriteButtonIcon.translatesAutoresizingMaskIntoConstraints = false
        self.constraint.append(self.favoriteButtonIcon.topAnchor.constraint(equalTo: self.favoriteButtonSubView.topAnchor, constant: 5))
        self.constraint.append(self.favoriteButtonIcon.trailingAnchor.constraint(equalTo: self.favoriteButtonSubView.trailingAnchor, constant: -5))
        self.constraint.append(self.favoriteButtonIcon.bottomAnchor.constraint(equalTo: self.favoriteButtonSubView.bottomAnchor, constant: -5))
        self.constraint.append(self.favoriteButtonIcon.heightAnchor.constraint(equalToConstant: 34))
        
        NSLayoutConstraint.activate(self.constraint)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Home View
        self.view.backgroundColor = UIColor(red: 255/255, green: 245/255, blue: 239/255, alpha: 1)
        
        // Favorite Button View
        self.favoriteButtonView.layer.cornerRadius = 10
        self.favoriteButtonView.backgroundColor = UIColor(patternImage: UIImage(named: homeViewModel.favoriteBackground)!)
        self.favoriteButtonView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openFavoriteScreen)))
        
        // Favorite Title
        self.favoriteButtonTitle.text = homeViewModel.favoriteTitle
        self.favoriteButtonTitle.font = UIFont(name: "Gilroy-ExtraBold", size: UIFont.labelFontSize)
        self.favoriteButtonTitle.textColor = .white
        
        // Favorite Courses
        self.favoriteButtonCourse.text = homeViewModel.favoriteCourse
        self.favoriteButtonCourse.font = UIFont(name: "Gilroy-Light", size: 15)
        self.favoriteButtonCourse.textColor = .white
        
        // Favorite Icon
        self.favoriteButtonIcon.image = UIImage(named: homeViewModel.favoriteIcon)
        self.favoriteButtonIcon.contentMode = .scaleAspectFit
        
    }
    
    // MARK: Action
    
    
    // Show Favorite Screen
    @objc func openFavoriteScreen() {
        let favoriteViewController = FavoriteViewController()
        self.navigationController?.pushViewController(favoriteViewController, animated: true)
    }


}

