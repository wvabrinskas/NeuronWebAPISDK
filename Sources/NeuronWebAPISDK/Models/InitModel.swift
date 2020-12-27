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
  
  public init(nodes: Int, activation: ActivationMode) {
    self.nodes = nodes
    self.activation = activation
  }
}

public struct InitModel: Codable {
  var layers: [Layer]
  var learningRate: Float
  var bias: Float
  var lossFunction: LossFunctionMode
  var lossThreshold: Float
  var modifier: ModifierMode? = nil
  var epochs: Int

  public init(layers: [Layer],
              learningRate: Float,
              bias: Float,
              lossFunction: LossFunctionMode,
              lossThreshold: Float,
              modifier: ModifierMode? = nil,
              epochs: Int) {
 
    self.layers = layers
    self.learningRate = learningRate
    self.bias = bias
    self.lossFunction = lossFunction
    self.lossThreshold = lossThreshold
    self.modifier = modifier
    self.epochs = epochs
  }
}
