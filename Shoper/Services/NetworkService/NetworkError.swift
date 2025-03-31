//
//  NetworkError.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 3/31/25.
//



import Foundation

enum NetworkError: Error {
  
  case invalidURL
  case responseError
  case decodingError(Error)
  case unknown(Error)
  
}
