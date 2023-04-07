//
//  PageView.swift
//  WSTraining
//
//  Created by Глеб Голощапов on 29.03.2023.
//

import SwiftUI

struct PageView: View {
    
    var page: Page
    
    @State private var isPresentedEmail = false
    
    var body: some View {
        VStack{
            
            HStack {
                VStack{
                    Button {
                        print()
                        isPresentedEmail.toggle()
                    } label: {
                        Text(page.buttonText)
                            .font(.system(size: 20))
                            .foregroundColor(Color("Blue"))
                            .padding(.leading, 15)
                    }.fullScreenCover(isPresented: $isPresentedEmail) {
                        Email   ()
                    }
                    
                    Spacer()
                }
                Spacer()
                Image("logo")
                
            }.frame(height: 165)
            
            Spacer(minLength: 60)
            
            VStack {
                Text(page.name)
                    .foregroundColor(Color("Green"))
                    .bold()
                    .font(.system(size: 20))
                
                Text(page.description)
                    .foregroundColor(Color("Gray"))
                    .font(.system(size: 14))
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
            
            HStack(spacing: 10) {
                ForEach(0 ..< 3) { page in
                    Circle()
                        .strokeBorder(Color("Blue"), lineWidth: page == self.page.tag ? 8 : 1)
                        .frame(width: 15)
                }
            }
            
            
            Spacer()
            
            Image(page.imageName).frame(height: 250)
            
            Spacer()
            
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(page: Page.samplePage)
    }
}
