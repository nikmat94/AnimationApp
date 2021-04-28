//
//  CurrentAnimation.swift
//  AnimationApp
//
//  Created by Никита  on 28.04.2021.
//
import UIKit
struct Animation {
    static var data = DataManager()
    
    var name: String
    var force: Float
    var duration: Float
    var delay: Float
    var damping: Float
    var velocity: Float
}

extension Animation {
    static func getAnimation() -> [Animation] {
        var animations: [Animation] = []
        
        let newNames: [String] = data.names.shuffled()
        
        for index in 0..<data.names.count {
           animations.append(Animation(name: newNames[index],
                                       force: round(Float.random(in: 0.5..<1) * 100) / 100,
                                       duration: round(Float.random(in: 0.5..<1) * 100) / 100,
                                       delay: round(Float.random(in: 0.1..<0.5) * 100) / 100,
                                       damping: round(Float.random(in: 0.5..<1) * 100) / 100,
                                       velocity: round(Float.random(in: 0.5..<1) * 100) / 100))
        }
        return animations
    }
}
