//
//  DataHighscore.swift
//  ChickenCard
//
//  Created by Ngan Phan Thi Thu on 24/08/2022.
//

import Foundation

let userDefaults = UserDefaults.standard
let array = [1,2,3]
userDefaults.set(array, forKey: "highscore")
