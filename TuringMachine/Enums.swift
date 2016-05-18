//
//  Enums.swift
//  TuringMachine
//
//  Created by Blake Lockley on 15/05/2016.
//  Copyright © 2016 Blake Lockley. All rights reserved.
//

import Foundation

enum Bit {
  case Zero, One
  var isZero: Bool {return self == .Zero }
}

enum Direction {
  case Left, Right
  var isLeft: Bool { return self == .Left }
}