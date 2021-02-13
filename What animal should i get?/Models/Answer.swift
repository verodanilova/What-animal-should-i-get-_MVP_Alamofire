//
//  Answer.swift
//  What animal should i get?
//
//  Created by Tanya on 13.02.2021.
//

enum AnimalType: Character {
    case cat = "🐈"
    case dog = "🐩"
    case mouse = "🦝"
    case fish = "🐠"
    
    var definition: String {
        switch self {
        case .cat:
            return "You are restrained and love freedom. You value not the quantity, but the quality of your friends"
        case .dog:
            return "You are friendly and open. You like to surround yourself with people and you are always ready to help"
        case .mouse:
            return "You are resourceful and elusive. You are always on the move and love to work hard"
        case .fish:
            return "You are calm and reasonable. You value consistency and comfort"
        }
    }
}

struct Answer {
    let text: String
    let type: AnimalType
}
