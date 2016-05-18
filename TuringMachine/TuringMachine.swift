//
//  TuringMachine.swift
//  TuringMachine
//
//  Created by Blake Lockley on 15/05/2016.
//  Copyright © 2016 Blake Lockley. All rights reserved.
//

import Foundation

class TuringMachine {
  
  class func run(state: State?, tape: Tape, limit: Int, current: Int = 0) {
    print("\(current): [\(state?.n ?? -1)] \n\(tape)")
    
    guard current != limit else {
      return
    }
    guard let state = state else {
      return
    }
    
    let instruction = state.instructionForBit(tape.read())
    tape.write(instruction.write)
    tape.move(instruction.direction)
    run(instruction.state, tape: tape, limit: limit, current: current + 1)
  }
  
}