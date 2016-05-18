//
//  Instruction.swift
//  TuringMachine
//
//  Created by Blake Lockley on 15/05/2016.
//  Copyright © 2016 Blake Lockley. All rights reserved.
//

import Foundation

class Instruction {
  let write: Bit
  let direction: Direction
  var state: State!
  
  init(write: Bit, direction: Direction, state: State? = nil) {
    self.write = write
    self.direction = direction
    self.state = state
  }
}