//
//  FavoriteCustomCell.swift
//  Luni_App
//
//  Created by Boubakar Traore on 23/06/2022.
//

import UIKit

class FavoriteCustomCell : UITableViewCell {

    // MARK: Properties

    static let identifier = "FavoriteTableViewCell"

    let playImageView = UIImageView()
    let titleLabel = UILabel()
    let levelLabel = UILabel()
    let favoriteImageView = UIImageView()

    var constraint = [NSLayoutConstraint]()

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
        self.playImageView.translatesAutoresizingMaskIntoConstraints = false
        self.constraint.append(self.playImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20))
        self.constraint.append(self.playImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor))
        
        self.titleLabel.textColor = .white
        self.titleLabel.font = UIFont(name: "Gilroy-ExtraBold", size: UIFont.labelFontSize)
        self.addSubview(self.titleLabel)
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.constraint.append(self.titleLabel.leadingAnchor.constraint(equalTo: self.playImageView.trailingAnchor, constant: 10))
        self.constraint.append(self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10))
        
        self.levelLabel.textColor = .white
        self.levelLabel.font = UIFont(name: "Gilroy-Light", size: 10)
        self.addSubview(self.levelLabel)
        self.levelLabel.translatesAutoresizingMaskIntoConstraints = false
        self.constraint.append(self.levelLabel.leadingAnchor.constraint(equalTo: self.playImageView.trailingAnchor, constant: 10))
        self.constraint.append(self.levelLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor))

        self.favoriteImageView.image = UIImage(named: "LikeIcon")
        self.favoriteImageView.contentMode = .scaleAspectFit
        self.addSubview(self.favoriteImageView)
        self.favoriteImageView.translatesAutoresizingMaskIntoConstraints = false
        self.constraint.append(self.favoriteImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor))
        self.constraint.append(self.favoriteImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20))
        
        NSLayoutConstraint.activate(self.constraint)
        
    }

    func configure(title: String, level: Level, status: Bool) {
        self.titleLabel.text = title
        self.levelLabel.text = level.rawValue
        self.initialize()
    }

    override func prepareForReuse() {
        self.playImageView.image = nil
        self.titleLabel.text = nil
        self.levelLabel.text = nil
        self.favoriteImageView.image = nil
    }

}

