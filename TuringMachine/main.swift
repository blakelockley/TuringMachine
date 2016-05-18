//
//  main.swift
//  TuringMachine
//
//  Created by Blake Lockley on 15/05/2016.
//  Copyright © 2016 Blake Lockley. All rights reserved.
//

import Foundation

private typealias Inst = (write: Int, direction: String, state: Int)
private typealias Stat = (zero: Inst, one: Inst)

main:
while true {
  var inputs = [Stat]()
  
  let str: String = {
    while true {
      guard let fileName = input(message: "Load Machine: ") else {
        print("Issue...")
        continue
      }
      guard let contents = try? String(contentsOfFile: "\(fileName)") else {
        print("Cannot find \(fileName)")
        continue
      }
      return contents
    }
  }()
  
  for line in str.componentsSeparatedByString("\n") {
    func extract(str: String) -> Inst {
      if str.containsString("L") {
        let comps = str.componentsSeparatedByString("L")
        return (Int(comps.first!)!, "L", Int(comps.last!)!)
      }
      
      let comps = str.componentsSeparatedByString("R")
      return (Int(comps.first!)!, "R", Int(comps.last!)!)
    }
    
    let instructions = line.componentsSeparatedByString(" ")
    let zero = extract(instructions.first!)
    let one = extract(instructions.last!)
    inputs.append((zero, one))
  }
  
  let states:[State] = {
    var states = [State]()
    for (i, stat) in inputs.enumerate() {
      states.append(State(n: i,
        zero: Instruction(write: stat.zero.write == 0 ? .Zero : .One, direction: stat.zero.direction == "L" ? .Left : .Right),
        one: Instruction(write: stat.one.write == 0 ? .Zero : .One, direction: stat.one.direction == "L" ? .Left : .Right)))
    }
    
    for (i, s) in inputs.enumerate() {
      if s.zero.state < states.count {
        states[i].zero.state = states[s.zero.state]
      }
      if s.one.state < states.count {
        states[i].one.state = states[s.one.state]
      }
    }
    return states
  }()
  
  while true {
    guard let str = input(message: "Enter tape: ") else {
      print("Issue...")
      continue
    }
    
    guard str != "new" else  {
      print("New machine...")
      continue main
    }
    
    guard let num = input(message: "Limit: ") else {
      print("Issue...")
      continue
    }
    
    guard let tape = Tape(str: str) else {
      print("Issue")
      continue
    }
    
    TuringMachine.run(states.first!, tape: tape, limit: Int(num)!)
  }
}