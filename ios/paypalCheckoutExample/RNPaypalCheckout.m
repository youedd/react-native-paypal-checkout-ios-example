//
//  PaypalCheckoutModule.m
//  paypalCheckoutExample
//
//  Created by Youssef  on 11/03/2023.
//

#import <React/RCTBridgeModule.h>


@interface RCT_EXTERN_MODULE(RNPaypalCheckout, NSObject)
  RCT_EXTERN_METHOD(start)


  + (BOOL)requiresMainQueueSetup
  {
      return NO;
  }

@end
