//
//  NeruoModel.swift
//  Nameley
//
//  Created by William Vabrinskas on 12/12/20.
//  Copyright © 2020 William Vabrinskas. All rights reserved.
//

import Foundation

public enum ActivationMode: String, Codable {
  case reLu, sigmoid, leakyReLu, swish, none
}

public enum LossFunctionMode: String, Codable {
  case meanSquareLoss
}

public enum ModifierMode: String, Codable {
  case softmax
}

public struct Layer: Codable {
  public var nodes: Int
  public var activation: ActivationMode
}

public struct InitModel: Codable {
  var layers: [Layer]
  var learningRate: Float
  var bias: Float
  var activation: ActivationMode
  var lossFunction: LossFunctionMode
  var lossThreshold: Float
  var modifier: ModifierMode

  public init(layers: [Layer],
              learningRate: Float,
              bias: Float,
              activation: ActivationMode,
              lossFunction: LossFunctionMode,
              lossThreshold: Float,
              modifier: ModifierMode) {
 
    self.layers = layers
    self.learningRate = learningRate
    self.bias = bias
    self.activation = activation
    self.lossFunction = lossFunction
    self.lossThreshold = lossThreshold
    self.modifier = modifier
  }
}
