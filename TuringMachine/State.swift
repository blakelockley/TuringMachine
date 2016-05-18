//
//  State.swift
//  TuringMachine
//
//  Created by Blake Lockley on 15/05/2016.
//  Copyright © 2016 Blake Lockley. All rights reserved.
//

import Foundation

class State {
  let n: Int
  let zero: Instruction
  let one: Instruction
  
  init(n: Int, zero: Instruction, one: Instruction) {
    self.n = n
    self.zero = zero
    self.one = one
  }
  
  func instructionForBit(bit: Bit) -> Instruction {
    return bit.isZero ? zero : one
  }
}