//
//  Tape.swift
//  TuringMachine
//
//  Created by Blake Lockley on 15/05/2016.
//  Copyright © 2016 Blake Lockley. All rights reserved.
//

import Foundation

class Tape: CustomStringConvertible {
  private var value: [Bit]
  private var head: Int = 0
  
  init(inital: [Bit]) {
    self.value = inital
  }
  
  convenience init?(str: String) {
    guard NSPredicate(format: "SELF MATCHES %@", "^(0|1)+$").evaluateWithObject(str) else {
      return nil
    }
    self.init(inital: str.characters.map({String($0)}).map({$0 == "0" ? .Zero : .One }))
  }
  
  private func extendTape(direction: Direction) {
    if direction.isLeft {
      value = [.Zero] + value
      return head += 1
    }
    value += [.Zero]
  }
  
  func read() -> Bit {
    return value[head]
  }
  
  func write(bit: Bit) {
    value[head] = bit
  }
  
  func move(direction: Direction) {
    head += direction.isLeft ? -1 : 1
    if !(0..<value.count ~= head) {
      extendTape(direction)
    }
  }
  
  var description: String {
    let tape = value.reduce("", combine: { $0 + ($1.isZero ? "0" : "1") })
    let point: String = (0..<head).reduce("", combine: {$0.0 + " "}) + "^"
    return "\(tape)\n\(point)"
  }
}
