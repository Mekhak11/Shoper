//
//  GetReciepeUseCase.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 5/6/25.
//

import Foundation
import Combine

final class GetReciepeUseCase: AIAssistantUseCase {
  
  func execute(by prompt: String) -> AnyPublisher<ReciepeModel, NetworkError> {
    aiRepository.getReciepe(by: prompt)
      .map {
        ReciepeModel(dto: $0)
      }
      .eraseToAnyPublisher()
  }
  
}
