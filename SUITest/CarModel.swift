//
//  CarModel.swift
//  SUITest
//
//  Created by Сергей Веретенников on 18/11/2022.
//

import SwiftUI

struct CarModel: Identifiable {
    
    enum Variety: String {
        case common = "Common"
        case rare = "Rare"
        case epic = "Epic"
        case insane = "Insane"
    }
    
    enum CarChars {
        case tank
        case respect
        case vehicle
        case maxDist
    }
    
    static func setCars() -> [CarModel] {
        
        var array = [CarModel]()
        let carOne = CarModel(id: UUID(), title: "Кчау", image: "carOne", tank: 40, respect: 100, vehicle: 30, maxDist: 2.2, isCarSelected: true, level: 3, levelProgress: 0.4, brandImage: "mercedece", variety: .insane, expirience: 29378)
        let carTwo = CarModel(id: UUID(), title: "Мэтр", image: "carTwo", tank: 72, respect: 10, vehicle: 78, maxDist: 28.3, isCarSelected: false, level: 5, levelProgress: 0.1, brandImage: "nissan", variety: .common, expirience: 44242)
        let carThree = CarModel(id: UUID(), title: "Артем", image: "carTwo", tank: 13, respect: 21, vehicle: 255, maxDist: 0.9, isCarSelected: false, level: 1, levelProgress: 0.7, brandImage: "mercedece", variety: .epic, expirience: 2222)
        let carFour = CarModel(id: UUID(), title: "Николай", image: "carTwo", tank: 78, respect: 44, vehicle: 228, maxDist: 1.8, isCarSelected: false, level: 2, levelProgress: 0.4, brandImage: "nissan", variety: .rare, expirience: 87523)
        
        array.append(carOne)
        array.append(carTwo)
        array.append(carThree)
        array.append(carFour)
        
        return array
    }
    
    static func getCar() -> CarModel {
        CarModel(id: UUID(), title: "Кчау", image: "carOne", tank: 40, respect: 100, vehicle: 30, maxDist: 2.2, isCarSelected: true, level: 3, levelProgress: 0.4, brandImage: "mercedece", variety: .insane, expirience: 72371)
    }
    
    var id: UUID
    var title: String
    var image: String
    var tank: Int
    var respect: Int
    var vehicle: Int
    var maxDist: Double
    var isCarSelected: Bool
    var level: Int
    var levelProgress: CGFloat
    var brandImage: String
    var variety: CarModel.Variety
    var expirience: Int
}
