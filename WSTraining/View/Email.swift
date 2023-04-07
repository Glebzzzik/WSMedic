//
//  Email.swift
//  WSTraining
//
//  Created by Глеб Голощапов on 05.04.2023.
//

import SwiftUI

struct Email: View {
    
    @State private var email = ""
    @StateObject var emailVM = EmailVM()
    
    @State private var isPresentedCode = false
    
    var body: some View {
        VStack {
            
            Spacer()
            
            VStack(spacing: 20) {
                HStack {
                    Image("Hand")
                        .frame(width: 32, height: 32)
                    Text("Добро пожаловать")
                        .bold()
                        .font(.system(size: 24))
                    Spacer()
                }.padding(.horizontal, 20)
                
                HStack {
                    Text("Войдите, чтобы пользоваться функциями приложения")
                        .font(.system(size: 15))
                        .multilineTextAlignment(.leading)
                    Spacer()
                }.padding(.horizontal, 20)
            }
            
            Spacer()
            
            VStack(spacing: 50) {
                
                VStack(spacing: 20) {
                    HStack {
                        Text("Вход по E-mail")
                            .font(.system(size: 14))
                            .foregroundColor(Color("DarkGray"))
                        
                        Spacer()
                    }.padding(.horizontal, 20)
                    
                    TextField("example@mail.ru", text: $email)
                        .background(
                            Rectangle()
                                .foregroundColor(Color("LightGray"))
                                .frame(height: 50)
                                .cornerRadius(10)
                        ).padding(.horizontal, 20)
                }
                
                Button {
                    emailVM.sendCode(email: email) { ans in
                        if ans == "Успешно код отправлен" {
                            print("NICE")
                            isPresentedCode.toggle()
                        } else {
                            print("NOOOO")
                        }
                    }
                } label: {
                    ZStack {
                        Rectangle()
                            .foregroundColor(isValidEmail(email) ? Color("DarkBlue") : Color("LightBlue"))
                            .frame(height: 50)
                            .cornerRadius(10)
                        
                        Text("Далее")
                            .foregroundColor(.white)
                            .font(.system(size: 17))
                    }.padding(.horizontal, 20)
                }.disabled(!isValidEmail(email))
                    .fullScreenCover(isPresented: $isPresentedCode) {
                        Code()
                    }
            }
            
            Spacer()
            
            VStack(spacing: 15) {
                Text("Или войдите с помощью")
                    .font(.system(size: 15))
                    .foregroundColor(Color("Gray"))
                
                Button {
                    print()
                } label: {
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color("Gray"), lineWidth: 1)
                                                    .frame(height: 60)
                        Text("Войти с Яндекс")
                            .font(.system(size: 17))
                            .foregroundColor(.black)
                    }.padding(.horizontal, 20)
                }

                
            }
            
            
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    
}

struct Email_Previews: PreviewProvider {
    static var previews: some View {
        Email()
    }
}
