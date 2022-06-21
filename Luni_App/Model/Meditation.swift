//
//  Meditation.swift
//  Luni_App
//
//  Created by Boubakar Traore on 21/06/2022.
//

import Foundation

enum Level : String {
    case BEGINNER
    case MEDIUM
    case ADVANCED
    
}

struct Meditation {
    
    let title: String
    let level: Level
    var favorite: Bool
    
    
    init(title: String, level: Level) {
        self.title = title
        self.level = level
        self.favorite = false
    }
    
    func isFavorite() -> Bool {
        return self.favorite
    }
    
    mutating func changeStatus() {
        self.favorite = !self.favorite
    }
}
