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
  case meanSquareLoss, crossEntropy
}

public enum ModifierMode: String, Codable {
  case softmax
}

public enum LayerTypeMode: String, Codable {
  case input, hidden, output
}

public struct Layer: Codable {
  public var nodes: Int
  public var activation: ActivationMode
  public var layer: LayerTypeMode
  
  public init(nodes: Int, activation: ActivationMode, layer: LayerTypeMode) {
    self.nodes = nodes
    self.activation = activation
    self.layer = layer
  }
}

public struct InitModel: Codable {
  public var layers: [Layer]
  public var learningRate: Float
  public var bias: Float
  public var lossFunction: LossFunctionMode
  public var lossThreshold: Float
  public var modifier: ModifierMode? = nil
  public var epochs: Int

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
