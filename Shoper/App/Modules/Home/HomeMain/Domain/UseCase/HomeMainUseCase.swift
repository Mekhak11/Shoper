//
//  HomeMainUseCase.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 4/22/25.
//

import Foundation
import Combine

final class HomeMainUseCase: HomeUseCase {
  func execute() -> AnyPublisher<HomeModelReal, NetworkError> {
    homeRepository.home()
      .map {
        HomeModelReal(dto: $0)
      }
      .eraseToAnyPublisher()
  }
}
