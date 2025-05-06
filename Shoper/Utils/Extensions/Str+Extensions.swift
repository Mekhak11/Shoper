//
//  Str+Extensions.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 5/6/25.
//

import Foundation

extension String {
  func parseRecipe() -> (ingredients: [String], instructions: [String]) {
    let components = self.components(separatedBy: "Instructions:")
    guard components.count == 2 else { return ([], []) }
    
    let ingredients = components[0]
      .replacingOccurrences(of: "Ingredients:", with: "")
      .trimmingCharacters(in: .whitespacesAndNewlines)
      .components(separatedBy: "\n")
      .filter { !$0.isEmpty }
    
    let instructions = components[1]
      .trimmingCharacters(in: .whitespacesAndNewlines)
      .components(separatedBy: "\n")
      .filter { !$0.isEmpty }
    
    return (ingredients, instructions)
  }
}
