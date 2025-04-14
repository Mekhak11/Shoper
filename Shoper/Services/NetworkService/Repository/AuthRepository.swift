//
//  AuthRepository.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 3/31/25.
//
import Combine

//MARK: - Change
protocol ShopRepository {
  
  func find(payload: String) -> AnyPublisher<String, NetworkError>

}

final class ShopDefaultRepository: NetworkManager, ShopRepository, ObservableObject {
  
  func find(payload: String) -> AnyPublisher<String, NetworkError> {
    request(ShopRoute.find(payload: payload), type: String.self)
  }
    
}
