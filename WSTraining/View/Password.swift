//
//  Password.swift
//  WSTraining
//
//  Created by Глеб Голощапов on 07.04.2023.
//

import SwiftUI

class PasswordValue: ObservableObject {
    @Published var passwordValue = [String]()
}


struct Password: View {
    
    @State private var isTapped = false
    @State private var passwordValue = PasswordValue()
    private var index = 0
    
    
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            
            Spacer()
            
            VStack(spacing: 50) {
                HStack {
                    Spacer()
                    Button {
                        print()
                    } label: {
                        Text("Пропустить")
                    }
                    
                }.padding(.horizontal, 20)
                
                VStack(spacing: 15) {
                    Text("Создайте пароль")
                        .bold()
                        .font(.system(size: 24))
                    
                    Text("Для защиты ваших персональных данных")
                        .foregroundColor(Color("Gray"))
                        .font(.system(size: 15))
                }
                
                
                HStack(spacing: 12) {
                    
                    
                    Circle()
                        .strokeBorder(Color("DarkBlue"), lineWidth: 2)
                        .frame(width: 16, height: 16)
                    
                    
                    Circle()
                        .strokeBorder(Color("DarkBlue"), lineWidth: 2)
                        .frame(width: 16, height: 16)
                    
                    Circle()
                        .strokeBorder(Color("DarkBlue"), lineWidth: 2)
                        .frame(width: 16, height: 16)
                    
                    Circle()
                        .strokeBorder(Color("DarkBlue"), lineWidth: 2)
                        .frame(width: 16, height: 16)
                }
                
                
                VStack() {
                    HStack() {
                        CustomPasswordButton(number: "1", password: passwordValue)
                        CustomPasswordButton(number: "2", password: passwordValue)
                        CustomPasswordButton(number: "3", password: passwordValue)
                    }
                    
                    HStack() {
                        CustomPasswordButton(number: "4", password: passwordValue)
                        CustomPasswordButton(number: "5", password: passwordValue)
                        CustomPasswordButton(number: "6", password: passwordValue)
                    }
                    
                    HStack() {
                        CustomPasswordButton(number: "7", password: passwordValue)
                        CustomPasswordButton(number: "8", password: passwordValue)
                        CustomPasswordButton(number: "9", password: passwordValue)
                    }
                    
                    HStack() {
                        CustomPasswordButton(number: "+", password: passwordValue)
                        CustomPasswordButton(number: "0", password: passwordValue)
                        CustomPasswordButton(number: "D", password: passwordValue)
                    }
                }
                .padding(.horizontal, 20)
            }
            Spacer()
        }
    }
    
    struct CustomPasswordButton: View {
        
        var number: String
        @State private var isTapped: Bool = false
        @State var password: PasswordValue
        
        var body: some View {
            if number != "+" && number != "D" {
                Button {
                    print(number)
                    
                    if password.passwordValue.count < 4 {
                        password.passwordValue.append("\(number)")
                        
                    }
                    
                    
                    print(password.passwordValue)
                } label: {
                    Text("\(number)")
                }.buttonStyle(MyButtonStyle())}
            if number == "D" {
                Button {
                    if password.passwordValue.count > 0 {
                        password.passwordValue.removeLast()
                        
                    }
                } label: {
                    Image(systemName: "delete.left")
                        .padding(.all, 40)
                        .font(.custom("", size: 25))
                    
                        .foregroundColor(.black)
                        .background(Color.white)
                        .clipShape(Circle())
                }
            }
            if number == "+" {
                Button {} label: {
                    Image(systemName: "delete.left")
                        .padding(.all, 40)
                        .font(.custom("", size: 25))
                    
                        .foregroundColor(.white)
                        .background(Color.white)
                        .clipShape(Circle())
                }
            }
        }
    }
    
}



struct MyButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(.all, 40)
            .font(.custom("", size: 25))
        
            .foregroundColor(configuration.isPressed ? .white : .black)
            .background(configuration.isPressed ? Color("DarkBlue") : Color("LightGray"))
            .clipShape(Circle())
    }
}

struct Password_Previews: PreviewProvider {
    static var previews: some View {
        Password()
    }
}
