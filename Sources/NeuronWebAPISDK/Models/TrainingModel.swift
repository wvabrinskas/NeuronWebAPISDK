//
//  TrainingModel.swift
//  Nameley
//
//  Created by William Vabrinskas on 12/12/20.
//  Copyright © 2020 William Vabrinskas. All rights reserved.
//

import Foundation

struct TrainingModel: Codable {
  var inputs: [Float]
  var correct: [Float]
}

struct MasterTrainingModel: Codable {
  var trainingData: [TrainingModel]
  var count: Int
}
