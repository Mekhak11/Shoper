//
//  HomeRepository.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 3/31/25.
//
import Combine

protocol HomeRepository {
  
  func find(payload: String) -> AnyPublisher<String, NetworkError>
  func home() -> AnyPublisher<HomeDTO, NetworkError>

}

final class HomeDefaultRepository: NetworkManager, HomeRepository {
  
  func home() -> AnyPublisher<HomeDTO, NetworkError> {
    request(HomeRout.home, type: HomeDTO.self)
  }
  
  func find(payload: String) -> AnyPublisher<String, NetworkError> {
    request(HomeRout.find(payload: payload), type: String.self)
  }
    
}
