//
//  CardView.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 4/13/25.
//

import SwiftUI


struct CartView<M: CartViewModeling>: View {
  
  @StateObject var viewModel:M = CartViewModel() as! M
  @State var selectionMode: SelectionType = .lowest
  @State var totalprice = 0.0
  @State var change: Bool = true
  var body: some View {
    VStack {
      ScrollView {
        VStack(spacing: 20) {
          ForEach($viewModel.products, id: \.id) { $product in
            CartCellView(selectionMode: $selectionMode, product: $product) {
              viewModel.products.removeAll(where: {$0.id == product.id})
            }

          }
        }
        .padding(.vertical)
      }
      Divider()
      lowestView
    }
    .background(Color.blue.opacity(0.04).ignoresSafeArea())
    .onAppear {
      totalprice = totalMinPrice()
    }
  }
}

extension CartView {
  
  private var lowestView: some View {
    HStack {
      totalView
        .padding(.horizontal)
      Spacer()
      Divider()
        .frame(maxHeight: 150)
      
      VStack(alignment: .leading) {
        HStack {
          Button {
            selectionMode = .lowest
            totalprice = totalMinPrice()
          } label: {
            HStack {
              Text("Lowest each:")
                .foregroundColor(selectionMode == SelectionType.lowest ? .green : .gray)
              Image(systemName: selectionMode == SelectionType.lowest ? "checkmark.square.fill" : "square")
                .foregroundColor(selectionMode == SelectionType.lowest ? .green : .gray)
                .font(.title2)
                .padding(4)
            }
            
          }
        }
        HStack {
          Button {
            if validateProductsHaveThreePrices() {
              selectionMode = calculateLowestSupermarket()
            }
          } label: {
            HStack {
              Text("Lowest Sum")
                .foregroundColor(selectionMode != SelectionType.lowest ? .green : .gray)
              Image(systemName: selectionMode != SelectionType.lowest ? "checkmark.square.fill" : "square")
                .foregroundColor(selectionMode != SelectionType.lowest ? .green : .gray)
                .font(.title2)
                .padding(4)
            }
          }
        }
      }
      Spacer()
      
    }
  }
  
  private var totalView: some View {
    VStack(alignment: .leading) {
      HStack {
        Text("Total Price")
        Image(systemName: "cart.fill")
      }
      Text("\(String(format: "%.f", selectionMode == .lowest ? totalMinPrice() : calculateTotalForMinSup() )) AMD")
        .font(.headline)
    }
  }
  
  func calculateLowestSupermarket() -> SelectionType {
      var marketTotals: [Int: Double] = [:]
      
      for product in viewModel.products {
          for price in product.prices {
              marketTotals[price.marketId, default: 0.0] += price.price * Double(product.count)
          }
      }
      
      if let id = marketTotals.min(by: { $0.value < $1.value })?.key {
          totalprice = marketTotals[id] ?? 0.0
          return SelectionType.supermarket(id)
      } else {
          return .lowest
      }
  }
  
  func calculateTotalForMinSup() -> Double {
    var marketTotals: [Int: Double] = [:]
    
    for product in viewModel.products {
        for price in product.prices {
            marketTotals[price.marketId, default: 0.0] += price.price * Double(product.count)
        }
    }
    

    if let id = marketTotals.min(by: { $0.value < $1.value })?.key {
        let totalprice = marketTotals[id] ?? 0.0
      if selectionMode != .lowest {
        DispatchQueue.main.async {
          selectionMode = calculateLowestSupermarket()
        }
      }
      return totalprice
    }
    
    if selectionMode != .lowest {
      DispatchQueue.main.async {
        selectionMode = calculateLowestSupermarket()
      }
    }
    return totalprice
    
  }

  func totalMinPrice() -> Double {
      viewModel.products.reduce(0) { total, product in
          if let minPrice = product.prices.min(by: { $0.price < $1.price })?.price {
              return total + (minPrice * Double(product.count))
          }
          return total
      }
  }
  
  //  func calidateAllProducts() {
  func validateProductsHaveThreePrices() -> Bool {
    for product in viewModel.products {
      if product.prices.count != 3 {
        return false
      }
    }
    return true
  }
  //  }
}


struct CheckBoxView: View {
  @Binding var isChecked: Bool
  var action: () -> ()
  
  var body: some View {
    Button(action: {
      isChecked.toggle()
    }) {
      Image(systemName: isChecked ? "checkmark.square.fill" : "square")
        .foregroundColor(isChecked ? .blue : .gray)
        .font(.title2)
        .padding(4)
    }
    .buttonStyle(.plain)
  }
}

struct StepperButtonView: View {
  @Binding var count: Int
  
  var body: some View {
    VStack(spacing: 4) {
      Button(action: {
        count += 1
      }) {
        Image(systemName: "chevron.up")
          .font(.headline)
          .foregroundColor(.blue)
          .padding(6)
          .background(Circle().fill(Color.blue.opacity(0.1)))
      }
      
      Text("\(count)")
        .font(.headline)
        .frame(minWidth: 24)
        .padding(.vertical, 4)
      
      Button(action: {
        if count > 0 { count -= 1 }
      }) {
        Image(systemName: "chevron.down")
          .font(.headline)
          .foregroundColor(.blue)
          .padding(6)
          .background(Circle().fill(Color.blue.opacity(0.1)))
      }
    }
    .padding(8)
    .background(Color.white)
    .cornerRadius(12)
    .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
  }
  
}


