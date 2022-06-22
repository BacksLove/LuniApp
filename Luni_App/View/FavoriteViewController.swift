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
    
    let meditations = FavoriteMeditations.init()
    
    var topImageCollapsable: UIImageView!
    
    var favoriteTableView: UITableView!
    var titleLabel: UILabel!
    var courseLabel: UILabel!
    var descriptionLabel: UILabel!
    var backButtonImage: UIImage!
    
    var headerView: UIView!
    var separatorView: UIView!
    
    // MARK: - Birth and Death
    
    override func loadView() {
        super.loadView()
        
        self.headerView = UIView()
        self.view.addSubview(self.headerView)
        self.headerView.snp.makeConstraints { make in
            make.height.equalTo(350)
            make.top.leading.trailing.equalToSuperview()
        }
        
        self.topImageCollapsable = UIImageView()
        self.view.addSubview(self.topImageCollapsable)
        self.topImageCollapsable.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        
        self.titleLabel = UILabel()
        self.headerView.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.topImageCollapsable.snp.bottom).offset(50)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        self.courseLabel = UILabel()
        self.headerView.addSubview(self.courseLabel)
        self.courseLabel.snp.makeConstraints { make in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        self.descriptionLabel = UILabel()
        self.headerView.addSubview(self.descriptionLabel)
        self.descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(self.courseLabel.snp.bottom).offset(25)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        self.separatorView = UIView()
        self.headerView.addSubview(self.separatorView)
        self.separatorView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.top.equalTo(self.descriptionLabel.snp.bottom).offset(20)
            make.trailing.leading.equalToSuperview().inset(20)
        }
        
        self.favoriteTableView = UITableView()
        self.view.addSubview(self.favoriteTableView)
        self.favoriteTableView.snp.makeConstraints { make in
            make.top.equalTo(self.headerView.snp.bottom)
            make.trailing.bottom.leading.equalToSuperview().inset(20)
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Favorite View
        self.view.backgroundColor = UIColor(red: 255/255, green: 147/255, blue: 150/255, alpha: 1)
        
        // Header View
        
        // ScrollView
        self.headerViewHeight = NSLayoutConstraint(item: self.headerView as UIView, attribute: .height, relatedBy: .equal, toItem: self.headerView, attribute: .height, multiplier: 1, constant: 0)
        //self.headerViewHeight = view.heightAnchor.constraint(equalToConstant: 100)
        
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
        
    }
    
    
    
}

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


class FavoriteCustomCell : UITableViewCell {
    
    // MARK: Properties
    
    static let identifier = "FavoriteTableViewCell"
    
    let playImageView = UIImageView()
    let titleLabel = UILabel()
    let levelLabel = UILabel()
    let favoriteImageView = UIImageView()
    
    // MARK: Birth and Death
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func initialize() {
        
        self.backgroundColor = .clear
        
        self.playImageView.image = UIImage(named: "PlayIcon")
        self.playImageView.contentMode = .scaleAspectFit
        self.addSubview(self.playImageView)
        self.playImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(5)
            make.centerY.equalToSuperview()
        }
        
        self.titleLabel.textColor = .white
        self.titleLabel.font = UIFont(name: "Gilroy-ExtraBold", size: UIFont.labelFontSize)
        self.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.playImageView.snp.trailing).offset(10)
            make.top.equalToSuperview().inset(10)
        }
        
        self.levelLabel.textColor = .white
        self.levelLabel.font = UIFont(name: "Gilroy-Light", size: UIFont.labelFontSize)
        self.addSubview(self.levelLabel)
        self.levelLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.playImageView.snp.trailing).offset(10)
            make.bottom.equalToSuperview().inset(5)
        }
    
        self.favoriteImageView.contentMode = .scaleAspectFit
        self.addSubview(self.favoriteImageView)
        self.favoriteImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(15)
        }
        
    }
    
    func configure(title: String, level: Level, status: Bool) {
        self.titleLabel.text = title
        self.levelLabel.text = level.rawValue
        if status {
            favoriteImageView.image = UIImage(named: "LikeIcon")
        } else {
            favoriteImageView.image = UIImage(named: "LikeIcon")
        }
        self.initialize()
    }
    
    override func prepareForReuse() {
        self.playImageView.image = nil
        self.titleLabel.text = nil
        self.levelLabel.text = nil
        self.favoriteImageView.image = nil
    }
    
}
