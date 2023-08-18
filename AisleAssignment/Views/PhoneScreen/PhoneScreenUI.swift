//
//  PhoneScreenUI.swift
//  AisleAssignment
//
//  Created by Aakash  Bondwal  on 17/08/23.
//

import SwiftUI
import Alamofire

struct PhoneScreenUI: View {
    
    @State var isActive: Bool = true;
    @State private var number = ""
    @State private var countryCode = ""
    @ObservedObject var authViewModel = AuthViewModel();

    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                    Text("Get OTP")
                    
                    Text("Enter Your \nPhone Number")
                        .multilineTextAlignment(.leading)
                        .font(.largeTitle)
                        .bold()
                    
                    
                    //country code field
                    
                    HStack(spacing: 20) {
                        TextField("+91", text: $countryCode)
                            .padding(.leading,4)
                            .keyboardType(.numberPad)
                            .frame(width: 60, height: 50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(.systemGray4), lineWidth: 1)
                            )
                            
                        
                        //phone number field
                        
                        TextField("9999999999", text: $number)
                            .padding(.leading)
                            .keyboardType(.numberPad)
                            .frame(width: 200, height: 50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(.systemGray4), lineWidth: 1)
                            )
                        
                        
                        
                        
                        Spacer()
                    }
                    
                HStack{
                    Button(action: {
                        
                        DispatchQueue.main.async {
                            authViewModel.requestLogin(mobileNo: "\(countryCode)\(number)")
                        }
                    }) {
                        Text("Continue").foregroundColor(Color.black).font(.custom("Inter", size: 14)).background(RoundedRectangle(cornerRadius: 22).fill(Color.yellow).frame(width: 96, height: 40)).padding(EdgeInsets(top: 20, leading: 50, bottom: 0, trailing: 0))
                    }
                    if authViewModel.mobileStatusResponse != nil && (authViewModel.mobileStatusResponse?.status ?? false) {
                        NavigationLink(destination: OTPFieldView(number: "\(countryCode)\(number)")
                            .navigationBarBackButtonHidden(true), isActive: $isActive) {}.navigationBarHidden(true).navigationBarBackButtonHidden(true)
                    }
                    
                }.font(.custom("Inter", size: 14))
                                            

                                    
                    
                    
                    
                    
                    Spacer()
                    
                    
                }.padding(.top)
                .padding(.horizontal)
        }
        }

    func makePhoneNumberAPIRequest(number: String, completion: @escaping (Bool) -> Void) {
        let url = "https://app.aisle.co/V1/users/phone_number_login"
        let parameters: [String: Any] = ["number": number]
        
        AF.request(url, method: .post, parameters: parameters)
            .responseJSON { response in
                switch response.result {
                case .success:
                    completion(true)
                case .failure:
                    completion(false)
                }
            }
    }

}

struct PhoneScreenUI_Previews: PreviewProvider {
    static var previews: some View {
        PhoneScreenUI()
    }
}
