//
//  TrainingModel.swift
//  Nameley
//
//  Created by William Vabrinskas on 12/12/20.
//  Copyright © 2020 William Vabrinskas. All rights reserved.
//

import Foundation

public struct TrainingModel: Codable {
  public var inputs: [Float]
  public var correct: [Float]
  
  public init(inputs: [Float], correct: [Float]) {
    self.inputs = inputs
    self.correct = correct
  }
}

public struct MasterTrainingModel: Codable {
  public var trainingData: [TrainingModel]
  public var count: Int
  
  public init(trainingData: [TrainingModel], count: Int) {
    self.trainingData = trainingData
    self.count = count
  }
}
