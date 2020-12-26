//
//  NeruoModel.swift
//  Nameley
//
//  Created by William Vabrinskas on 12/12/20.
//  Copyright © 2020 William Vabrinskas. All rights reserved.
//

import Foundation

public enum ActivationMode: String, Codable {
  case reLu, sigmoid, leakyReLu
}

public enum LossFunctionMode: String, Codable {
  case meanSquareLoss
}

public struct InitModel: Codable {
  var inputs: Int
  var outputs: Int
  var hiddenLayers: Int?
  var learningRate: Float
  var bias: Float
  var activation: ActivationMode
  var lossFunction: LossFunctionMode
  var lossThreshold: Float

  public init(inputs: Int,
              outputs: Int,
              hiddenLayers: Int?,
              learningRate: Float,
              bias: Float,
              activation: ActivationMode,
              lossFunction: LossFunctionMode,
              lossThreshold: Float) {
    self.inputs = inputs
    self.outputs = outputs
    self.hiddenLayers = hiddenLayers
    self.learningRate = learningRate
    self.bias = bias
    self.activation = activation
    self.lossFunction = lossFunction
    self.lossThreshold = lossThreshold
  }
}
