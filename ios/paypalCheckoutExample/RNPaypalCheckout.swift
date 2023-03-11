//
//  RNPaypalCheckout.swift
//  paypalCheckoutExample
//
//  Created by Youssef  on 11/03/2023.
//

import Foundation
import PayPalCheckout

@objc(RNPaypalCheckout)
class RNPaypalCheckout : NSObject {
  
  @objc(start)
  public func start() {
    
    DispatchQueue.main.async {
      
      Checkout.set(config: CheckoutConfig(
        clientID: "client id",
        environment: .sandbox
      ))
      
      Checkout.start(
        createOrder: { createOrderAction in
          
          let amount = PurchaseUnit.Amount(currencyCode: .usd, value: "10.00")
          let purchaseUnit = PurchaseUnit(amount: amount)
          let order = OrderRequest(intent: .capture, purchaseUnits: [purchaseUnit])
          
          createOrderAction.create(order: order)
          
        }, onApprove: { approval in
          
          approval.actions.capture { (response, error) in
            print("Order successfully captured: \(response?.data)")
          }
          
        }, onCancel: {
          print("Order Canceled")
          
        }, onError: { error in
          print(error)
        }
      )
    }
  }
}
