//
//  Meditations.swift
//  Luni_App
//
//  Created by Boubakar Traore on 21/06/2022.
//

import Foundation


struct FavoriteMeditations {
    
    let title: String
    let courseNumber: Int
    let description: String
    var meditationsList: [Meditation]
    
    init() {
        self.title = "Favorite meditations"
        self.courseNumber = 7
        self.description = "This is the place where you can find all your favorites meditations"
        self.meditationsList = [Meditation]()
        self.meditationsList = self.fetchFavorite()
    }
    
    
    private func fetchFavorite() -> [Meditation] {
        var meditations = [Meditation]()
        
        let meditation1 = Meditation(title: "Brief beginner meditation", level: Level.BEGINNER)
        let meditation2 = Meditation(title: "Inner breath and mindfullness", level: Level.ADVANCED)
        let meditation3 = Meditation(title: "Another amazing meditation session", level: Level.BEGINNER)
        let meditation4 = Meditation(title: "Lunch break mediation", level: Level.MEDIUM)
        let meditation5 = Meditation(title: "Back to work session", level: Level.BEGINNER)
        
        meditations.append(meditation1)
        meditations.append(meditation2)
        meditations.append(meditation3)
        meditations.append(meditation4)
        meditations.append(meditation5)
        
        meditations.append(meditation1)
        meditations.append(meditation2)
        meditations.append(meditation3)
        meditations.append(meditation4)
        meditations.append(meditation5)
        meditations.append(meditation1)
        meditations.append(meditation2)
        meditations.append(meditation3)
        meditations.append(meditation4)
        meditations.append(meditation5)
        meditations.append(meditation1)
        meditations.append(meditation2)
        meditations.append(meditation3)
        meditations.append(meditation4)
        meditations.append(meditation5)
        meditations.append(meditation1)
        meditations.append(meditation2)
        meditations.append(meditation3)
        meditations.append(meditation4)
        meditations.append(meditation5)
        
        
        return meditations
    }
}
