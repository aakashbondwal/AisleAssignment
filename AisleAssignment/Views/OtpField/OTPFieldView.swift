//
//  OTPFieldView.swift
//  AisleAssignment
//
//  Created by Aakash  Bondwal  on 18/08/23.
//

import SwiftUI
import Alamofire

struct OTPFieldView: View {
    
    let number: String
    @State var timeRemaining: Int = 59
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var otp = ""
    @ObservedObject var authViewModel = AuthViewModel();
    @State var isActive = true;

    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            HStack {
                Text(number)
                
                Button(action: {
                    print("edit your number")
                }, label: {
                    Image(systemName: "pencil")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 14, height: 14)
                        .foregroundColor(.black)
                })
            }

            Text("Enter the \nOTP")
                .multilineTextAlignment(.leading)
                .font(.largeTitle)
                .bold()
            
            
            //otp field
            
            HStack {
                TextField("", text: $otp)
                    .padding(.leading,4)
                    .keyboardType(.numberPad)
                    .frame(width: 90, height: 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(.systemGray4), lineWidth: 1)
                    )
                
                
                    Spacer()
            }
            
            //button continue
            
            HStack{
                Button(action: {
                    DispatchQueue.main.async {
                        authViewModel.verifyOtp(mobileNo: number, otp: otp)
                    }
                }) {
                    Text("Continue").foregroundColor(Color.black).font(.custom("Inter", size: 14)).background(RoundedRectangle(cornerRadius: 22).fill(Color.yellow).frame(width: 96, height: 40)).padding(EdgeInsets(top: 20, leading: 50, bottom: 0, trailing: 0))
                }
                
                if authViewModel.otpStatusResponse != nil && (authViewModel.otpStatusResponse?.token != nil) {
                    NavigationLink(destination: mainTabView(token: authViewModel.otpStatusResponse? .token ?? "").navigationBarBackButtonHidden(true), isActive: $isActive) {
                    }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
                }
                
                //timer
                
                Text("00: \(timeRemaining)").bold().fontWeight(.heavy)
                    .onReceive(timer){_ in
                        if timeRemaining > 0 {
                            // if timeremaining is greater than zero subtract 1
                            timeRemaining -= 1
                        }
                    }
            }
            
            
            
            
            Spacer()
            
            
        }.padding(.top)
        .padding(.horizontal)
    }
    
    func makeOTPAPIRequest(number: String, otp: String, completion: @escaping (String?) -> Void) {
        let url = "https://app.aisle.co/V1/users/verify_otp"
        let parameters: [String: Any] = ["number": number, "otp": otp]
        
        AF.request(url, method: .post, parameters: parameters)
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    if let json = data as? [String: Any], let authToken = json["auth_token"] as? String {
                        completion(authToken)
                    } else {
                        completion(nil)
                    }
                case .failure:
                    completion(nil)
                }
            }
    }

    
}

struct OTPFieldView_Previews: PreviewProvider {
    static var previews: some View {
        OTPFieldView(number: "9876543212")
    }
}
