//
//  AuthViewModel.swift
//  AisleAssignment
//
//  Created by Aakash  Bondwal  on 18/08/23.
//

import Foundation

class AuthViewModel: ObservableObject {
    
    @Published var mobileStatusResponse: MobileStatusModel?;
    @Published var otpStatusResponse: OtpStatusModel?;
    
    func requestLogin(mobileNo: String) {
        print(["number" : mobileNo])
        APIManager.sharedInstance.PostRequestInterceptor(WebService.API_HOST + WebService.LOGIN_URL, body: ["number" : mobileNo]) { response in
            do{
                let jsonResponse = try JSONDecoder().decode(MobileStatusModel.self, from: response)
                DispatchQueue.main.async {
                    self.mobileStatusResponse = jsonResponse;
                }
            } catch {
                print(error)
            }
            
        } failure: { error in
            print(error)
        }
    }
    
    func verifyOtp(mobileNo: String, otp: String) {
        print(mobileNo, otp)
        APIManager.sharedInstance.PostRequestInterceptor(WebService.API_HOST + WebService.VERIFY_OTP_URL, body: ["number" : mobileNo, "otp": otp]) { response in
            do{
                let jsonResponse = try JSONDecoder().decode(OtpStatusModel.self, from: response)
                DispatchQueue.main.async {
                    debugPrint(jsonResponse)
                    self.otpStatusResponse = jsonResponse;
                }
            } catch {
                print("AF: ", error)
            }
            
        } failure: { error in
            print(error)
        }
    }
    
}
