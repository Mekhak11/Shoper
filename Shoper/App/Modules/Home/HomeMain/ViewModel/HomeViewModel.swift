//
//  HomeViewModel.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 4/13/25.
//

import Foundation
import Combine

final class HomeViewModel: HomeViewModeling, Identifiable {
  
//  var categoryProduct: [HomeModel] = [
//    HomeModel(
//      category: CategoryModel(
//        id: 0,
//        categoryName: "Canned Food",
//        image: "https://simplyhomecooked.com/wp-content/uploads/2015/04/Eggplant-spread-ikra-7.jpg"
//      ),
//      products: [ProductModel(
//        id: 1,
//        productName: "Eggplant caviar \"Artfood\" 360g",
//        imageURL: "https://media.yerevan-city.am/api/Image/Resize/ProductPhoto/1053273.png/250/250/false",
//        description: "",
//        subcategoryId: 1,
//        prices: [
//          PriceModel(marketId: 0, price: 1650.00),
//          PriceModel(marketId: 1, price: 1250.00),
//          PriceModel(marketId: 2, price: 1450.00),
//        ]
//      ),ProductModel(
//        id: 2,
//        productName: "Eggplant caviar \"Artfood\" 360g",
//        imageURL: "https://media.yerevan-city.am/api/Image/Resize/ProductPhoto/1053273.png/250/250/false",
//        description: "",
//        subcategoryId: 1,
//        prices: [
//          PriceModel(marketId: 0, price: 1650.00),
//          PriceModel(marketId: 1, price: 1250.00),
//          PriceModel(marketId: 2, price: 1450.00),
//        ]
//      ),ProductModel(
//        id: 3,
//        productName: "Eggplant caviar \"Artfood\" 360g",
//        imageURL: "https://media.yerevan-city.am/api/Image/Resize/ProductPhoto/1053273.png/250/250/false",
//        description: "",
//        subcategoryId: 1,
//        prices: [
//          PriceModel(marketId: 0, price: 1650.00),
//          PriceModel(marketId: 1, price: 1250.00),
//          PriceModel(marketId: 2, price: 1450.00),
//        ]
//      ),ProductModel(
//        id: 4,
//        productName: "Eggplant caviar \"Artfood\" 360g",
//        imageURL: "https://media.yerevan-city.am/api/Image/Resize/ProductPhoto/1053273.png/250/250/false",
//        description: "",
//        subcategoryId: 1,
//        prices: [
//          PriceModel(marketId: 0, price: 1650.00),
//          PriceModel(marketId: 1, price: 1250.00),
//          PriceModel(marketId: 2, price: 1450.00),
//        ]
//      ),ProductModel(
//        id: 5,
//        productName: "Eggplant caviar \"Artfood\" 360g",
//        imageURL: "https://media.yerevan-city.am/api/Image/Resize/ProductPhoto/1053273.png/250/250/false",
//        description: "",
//        subcategoryId: 1,
//        prices: [
//          PriceModel(marketId: 0, price: 1650.00),
//          PriceModel(marketId: 1, price: 1250.00),
//          PriceModel(marketId: 2, price: 1450.00),
//        ]
//      ),ProductModel(
//        id: 6,
//        productName: "Eggplant caviar \"Artfood\" 360g",
//        imageURL: "https://media.yerevan-city.am/api/Image/Resize/ProductPhoto/1053273.png/250/250/false",
//        description: "",
//        subcategoryId: 1,
//        prices: [
//          PriceModel(marketId: 0, price: 1650.00),
//          PriceModel(marketId: 1, price: 1250.00),
//          PriceModel(marketId: 2, price: 1450.00),
//        ]
//      ),ProductModel(
//        id: 7,
//        productName: "Eggplant caviar \"Artfood\" 360g",
//        imageURL: "https://media.yerevan-city.am/api/Image/Resize/ProductPhoto/1053273.png/250/250/false",
//        description: "",
//        subcategoryId: 1,
//        prices: [
//          PriceModel(marketId: 0, price: 1650.00),
//          PriceModel(marketId: 1, price: 1250.00),
//          PriceModel(marketId: 2, price: 1450.00),
//        ]
//      )]
//    ),
//    HomeModel(
//      category: CategoryModel(
//        id: 1,
//        categoryName: "Canned Food",
//        image: "https://simplyhomecooked.com/wp-content/uploads/2015/04/Eggplant-spread-ikra-7.jpg"
//      ),
//      products: [ProductModel(
//        id: 1,
//        productName: "Eggplant caviar \"Artfood\" 360g",
//        imageURL: "https://media.yerevan-city.am/api/Image/Resize/ProductPhoto/1053273.png/250/250/false",
//        description: "",
//        subcategoryId: 1,
//        prices: [
//          PriceModel(marketId: 0, price: 1650.00),
//          PriceModel(marketId: 1, price: 1250.00),
//          PriceModel(marketId: 2, price: 1450.00),
//        ]
//      ),ProductModel(
//        id: 2,
//        productName: "Eggplant caviar \"Artfood\" 360g",
//        imageURL: "https://media.yerevan-city.am/api/Image/Resize/ProductPhoto/1053273.png/250/250/false",
//        description: "",
//        subcategoryId: 1,
//        prices: [
//          PriceModel(marketId: 0, price: 1650.00),
//          PriceModel(marketId: 1, price: 1250.00),
//          PriceModel(marketId: 2, price: 1450.00),
//        ]
//      ),ProductModel(
//        id: 3,
//        productName: "Eggplant caviar \"Artfood\" 360g",
//        imageURL: "https://media.yerevan-city.am/api/Image/Resize/ProductPhoto/1053273.png/250/250/false",
//        description: "",
//        subcategoryId: 1,
//        prices: [
//          PriceModel(marketId: 0, price: 1650.00),
//          PriceModel(marketId: 1, price: 1250.00),
//          PriceModel(marketId: 2, price: 1450.00),
//        ]
//      ),ProductModel(
//        id: 4,
//        productName: "Eggplant caviar \"Artfood\" 360g",
//        imageURL: "https://media.yerevan-city.am/api/Image/Resize/ProductPhoto/1053273.png/250/250/false",
//        description: "",
//        subcategoryId: 1,
//        prices: [
//          PriceModel(marketId: 0, price: 1650.00),
//          PriceModel(marketId: 1, price: 1250.00),
//          PriceModel(marketId: 2, price: 1450.00),
//        ]
//      ),ProductModel(
//        id: 5,
//        productName: "Eggplant caviar \"Artfood\" 360g",
//        imageURL: "https://media.yerevan-city.am/api/Image/Resize/ProductPhoto/1053273.png/250/250/false",
//        description: "",
//        subcategoryId: 1,
//        prices: [
//          PriceModel(marketId: 0, price: 1650.00),
//          PriceModel(marketId: 1, price: 1250.00),
//          PriceModel(marketId: 2, price: 1450.00),
//        ]
//      ),ProductModel(
//        id: 6,
//        productName: "Eggplant caviar \"Artfood\" 360g",
//        imageURL: "https://media.yerevan-city.am/api/Image/Resize/ProductPhoto/1053273.png/250/250/false",
//        description: "",
//        subcategoryId: 1,
//        prices: [
//          PriceModel(marketId: 0, price: 1650.00),
//          PriceModel(marketId: 1, price: 1250.00),
//          PriceModel(marketId: 2, price: 1450.00),
//        ]
//      ),ProductModel(
//        id: 7,
//        productName: "Eggplant caviar \"Artfood\" 360g",
//        imageURL: "https://media.yerevan-city.am/api/Image/Resize/ProductPhoto/1053273.png/250/250/false",
//        description: "",
//        subcategoryId: 1,
//        prices: [
//          PriceModel(marketId: 0, price: 1650.00),
//          PriceModel(marketId: 1, price: 1250.00),
//          PriceModel(marketId: 2, price: 1450.00),
//        ]
//      ),]
//    ),
//    HomeModel(
//      category: CategoryModel(
//        id: 2,
//        categoryName: "Canned Food",
//        image: "https://simplyhomecooked.com/wp-content/uploads/2015/04/Eggplant-spread-ikra-7.jpg"
//      ),
//      products: [ProductModel(
//        id: 1,
//        productName: "Eggplant caviar \"Artfood\" 360g",
//        imageURL: "https://media.yerevan-city.am/api/Image/Resize/ProductPhoto/1053273.png/250/250/false",
//        description: "",
//        subcategoryId: 1,
//        prices: [
//          PriceModel(marketId: 0, price: 1650.00),
//          PriceModel(marketId: 1, price: 1250.00),
//          PriceModel(marketId: 2, price: 1450.00),
//        ]
//      ),ProductModel(
//        id: 2,
//        productName: "Eggplant caviar \"Artfood\" 360g",
//        imageURL: "https://media.yerevan-city.am/api/Image/Resize/ProductPhoto/1053273.png/250/250/false",
//        description: "",
//        subcategoryId: 1,
//        prices: [
//          PriceModel(marketId: 0, price: 1650.00),
//          PriceModel(marketId: 1, price: 1250.00),
//          PriceModel(marketId: 2, price: 1450.00),
//        ]
//      ),ProductModel(
//        id: 3,
//        productName: "Eggplant caviar \"Artfood\" 360g",
//        imageURL: "https://media.yerevan-city.am/api/Image/Resize/ProductPhoto/1053273.png/250/250/false",
//        description: "",
//        subcategoryId: 1,
//        prices: [
//          PriceModel(marketId: 0, price: 1650.00),
//          PriceModel(marketId: 1, price: 1250.00),
//          PriceModel(marketId: 2, price: 1450.00),
//        ]
//      ),ProductModel(
//        id: 4,
//        productName: "Eggplant caviar \"Artfood\" 360g",
//        imageURL: "https://media.yerevan-city.am/api/Image/Resize/ProductPhoto/1053273.png/250/250/false",
//        description: "",
//        subcategoryId: 1,
//        prices: [
//          PriceModel(marketId: 0, price: 1650.00),
//          PriceModel(marketId: 1, price: 1250.00),
//          PriceModel(marketId: 2, price: 1450.00),
//        ]
//      ),ProductModel(
//        id: 5,
//        productName: "Eggplant caviar \"Artfood\" 360g",
//        imageURL: "https://media.yerevan-city.am/api/Image/Resize/ProductPhoto/1053273.png/250/250/false",
//        description: "",
//        subcategoryId: 1,
//        prices: [
//          PriceModel(marketId: 0, price: 1650.00),
//          PriceModel(marketId: 1, price: 1250.00),
//          PriceModel(marketId: 2, price: 1450.00),
//        ]
//      ),ProductModel(
//        id: 6,
//        productName: "Eggplant caviar \"Artfood\" 360g",
//        imageURL: "https://media.yerevan-city.am/api/Image/Resize/ProductPhoto/1053273.png/250/250/false",
//        description: "",
//        subcategoryId: 1,
//        prices: [
//          PriceModel(marketId: 0, price: 1650.00),
//          PriceModel(marketId: 1, price: 1250.00),
//          PriceModel(marketId: 2, price: 1450.00),
//        ]
//      ),ProductModel(
//        id: 7,
//        productName: "Eggplant caviar \"Artfood\" 360g",
//        imageURL: "https://media.yerevan-city.am/api/Image/Resize/ProductPhoto/1053273.png/250/250/false",
//        description: "",
//        subcategoryId: 1,
//        prices: [
//          PriceModel(marketId: 0, price: 1650.00),
//          PriceModel(marketId: 1, price: 1250.00),
//          PriceModel(marketId: 2, price: 1450.00),
//        ]
//      ),]
//    ),
//    HomeModel(
//      category: CategoryModel(
//        id: 3,
//        categoryName: "Canned Food",
//        image: "https://simplyhomecooked.com/wp-content/uploads/2015/04/Eggplant-spread-ikra-7.jpg"
//      ),
//      products: [ProductModel(
//        id: 1,
//        productName: "Eggplant caviar \"Artfood\" 360g",
//        imageURL: "https://media.yerevan-city.am/api/Image/Resize/ProductPhoto/1053273.png/250/250/false",
//        description: "",
//        subcategoryId: 1,
//        prices: [
//          PriceModel(marketId: 0, price: 1650.00),
//          PriceModel(marketId: 1, price: 1250.00),
//          PriceModel(marketId: 2, price: 1450.00),
//        ]
//      ),ProductModel(
//        id: 2,
//        productName: "Eggplant caviar \"Artfood\" 360g",
//        imageURL: "https://media.yerevan-city.am/api/Image/Resize/ProductPhoto/1053273.png/250/250/false",
//        description: "",
//        subcategoryId: 1,
//        prices: [
//          PriceModel(marketId: 0, price: 1650.00),
//          PriceModel(marketId: 1, price: 1250.00),
//          PriceModel(marketId: 2, price: 1450.00),
//        ]
//      ),ProductModel(
//        id: 3,
//        productName: "Eggplant caviar \"Artfood\" 360g",
//        imageURL: "https://media.yerevan-city.am/api/Image/Resize/ProductPhoto/1053273.png/250/250/false",
//        description: "",
//        subcategoryId: 1,
//        prices: [
//          PriceModel(marketId: 0, price: 1650.00),
//          PriceModel(marketId: 1, price: 1250.00),
//          PriceModel(marketId: 2, price: 1450.00),
//        ]
//      ),ProductModel(
//        id: 4,
//        productName: "Eggplant caviar \"Artfood\" 360g",
//        imageURL: "https://media.yerevan-city.am/api/Image/Resize/ProductPhoto/1053273.png/250/250/false",
//        description: "",
//        subcategoryId: 1,
//        prices: [
//          PriceModel(marketId: 0, price: 1650.00),
//          PriceModel(marketId: 1, price: 1250.00),
//          PriceModel(marketId: 2, price: 1450.00),
//        ]
//      ),ProductModel(
//        id: 5,
//        productName: "Eggplant caviar \"Artfood\" 360g",
//        imageURL: "https://media.yerevan-city.am/api/Image/Resize/ProductPhoto/1053273.png/250/250/false",
//        description: "",
//        subcategoryId: 1,
//        prices: [
//          PriceModel(marketId: 0, price: 1650.00),
//          PriceModel(marketId: 1, price: 1250.00),
//          PriceModel(marketId: 2, price: 1450.00),
//        ]
//      ),ProductModel(
//        id: 6,
//        productName: "Eggplant caviar \"Artfood\" 360g",
//        imageURL: "https://media.yerevan-city.am/api/Image/Resize/ProductPhoto/1053273.png/250/250/false",
//        description: "",
//        subcategoryId: 1,
//        prices: [
//          PriceModel(marketId: 0, price: 1650.00),
//          PriceModel(marketId: 1, price: 1250.00),
//          PriceModel(marketId: 2, price: 1450.00),
//        ]
//      ),ProductModel(
//        id: 7,
//        productName: "Eggplant caviar \"Artfood\" 360g",
//        imageURL: "https://media.yerevan-city.am/api/Image/Resize/ProductPhoto/1053273.png/250/250/false",
//        description: "",
//        subcategoryId: 1,
//        prices: [
//          PriceModel(marketId: 0, price: 1650.00),
//          PriceModel(marketId: 1, price: 1250.00),
//          PriceModel(marketId: 2, price: 1450.00),
//        ]
//      ),]
//    ),
//  ]
  @Published var realCategoryProduct: HomeModelReal = HomeModelReal(categories: [])
  
  private var homeMainUseCase: HomeMainUseCase
  private var cancellable = Set<AnyCancellable>()
  
  init(homeMainUseCase: HomeMainUseCase) {
    self.homeMainUseCase = homeMainUseCase
  }
  
  func getCategoryProduct() {
    homeMainUseCase.execute()
          .sink { [weak self] result in
            switch result {
            case .finished:
                print("Finished")
            case .failure(let error):
                print(error)
            }
        } receiveValue: { [weak self]  products in
          self?.realCategoryProduct = products
        }.store(in: &cancellable)
  }
  
  
  
}
