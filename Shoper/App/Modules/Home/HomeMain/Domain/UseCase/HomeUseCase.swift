//
//  HomeUseCase.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 4/22/25.
//

import Foundation

class HomeUseCase {
  
  let homeRepository: HomeRepository
  
  init(homeRepository: HomeRepository) {
    self.homeRepository = homeRepository
  }
  
}
