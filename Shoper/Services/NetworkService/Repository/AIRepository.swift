//
//  AIRepository.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 5/6/25.
//

import Foundation
import Combine

protocol AIRepository {
  
  func getReciepe(by prompt: String) -> AnyPublisher<ReciepeDTO,NetworkError>

}

final class AIDefaultRepository: NetworkManager, AIRepository {
  
  func getReciepe(by prompt: String) -> AnyPublisher<ReciepeDTO,NetworkError> {
    request(AIAssistantRoute.reciepe(prompt: prompt), type: ReciepeDTO.self)
  }
    
}
