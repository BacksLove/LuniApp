//
//  ViewController.swift
//  Luni_App
//
//  Created by Boubakar Traore on 20/06/2022.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {

    // MARK: Properties
    
    var favoriteButtonView: UIView!
    var favoriteButtonTitle: UILabel!
    var favoriteButtonCourse: UILabel!
    var favoriteButtonIcon: UIImageView!
    var favoriteButtonSubView: UIView!
    
    // MARK: Birth and Death
    
    override func loadView() {
        super.loadView()
        
        self.favoriteButtonView = UIView()
        self.view.addSubview(self.favoriteButtonView)
        self.favoriteButtonView.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(150)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(100)
        }
        
        self.favoriteButtonSubView = UIView()
        self.favoriteButtonView.addSubview(self.favoriteButtonSubView)
        self.favoriteButtonSubView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(10)
        }
        
        self.favoriteButtonTitle = UILabel()
        self.favoriteButtonSubView.addSubview(self.favoriteButtonTitle)
        self.favoriteButtonTitle.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(5)
        }
        
        self.favoriteButtonCourse = UILabel()
        self.favoriteButtonSubView.addSubview(self.favoriteButtonCourse)
        self.favoriteButtonCourse.snp.makeConstraints { make in
            make.top.equalTo(self.favoriteButtonTitle.snp.bottom).offset(5)
            make.leading.equalToSuperview().inset(5)
        }
        
        self.favoriteButtonIcon = UIImageView()
        self.favoriteButtonSubView.addSubview(self.favoriteButtonIcon)
        self.favoriteButtonIcon.snp.makeConstraints { make in
            make.height.width.equalTo(34)
            make.top.trailing.bottom.equalToSuperview().inset(5)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Home View
        self.view.backgroundColor = UIColor(red: 255/255, green: 245/255, blue: 239/255, alpha: 1)
        
        // Favorite Button View
        self.favoriteButtonView.layer.cornerRadius = 10
        self.favoriteButtonView.backgroundColor = UIColor(patternImage: UIImage(named: "Favorite")!)
        self.favoriteButtonView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showFavoriteScreen)))
        
        // Favorite Text View
        
        
        // Favorite Title
        self.favoriteButtonTitle.text = "Favorite meditations"
        self.favoriteButtonTitle.textColor = .white
        
        // Favorite Courses
        self.favoriteButtonCourse.text = "10 Courses"
        self.favoriteButtonCourse.textColor = .white
        
        // Favorite Icon
        self.favoriteButtonIcon.image = UIImage(named: "Oval")
        self.favoriteButtonIcon.contentMode = .scaleAspectFit
        
    }
    
    // MARK: Action
    
    @objc func showFavoriteScreen() {
        let favoriteViewController = FavoriteViewController()
        self.navigationController?.pushViewController(favoriteViewController, animated: true)
    }


}

