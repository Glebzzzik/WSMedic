//
//  Main.swift
//  WSTraining
//
//  Created by Глеб Голощапов on 10.04.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct Main: View {
    
    @StateObject var viewModel = MainVM()
    
    @State var imageURLs: [String] =  ["https://otkrit-ka.ru/uploads/posts/2021-11/krasivye-foto-kartinki-rik-i-morti-1.jpg", "https://phonoteka.org/uploads/posts/2021-04/1619154262_49-phonoteka_org-p-rik-i-morti-fon-60.png"]
    
    @State private var searchText = ""
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 30) {
                ZStack {
                    TextField("", text: $searchText)
                        .padding(.leading, 20)
                        .foregroundColor(Color("DarkGray"))
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 50)
                                .foregroundColor(Color("LightGray"))
                        )
                    if !searchText.isEmpty {
                        HStack(spacing: 1) {
                            Image("search")
                            Spacer()
                        }
                        
                    }
                    else {
                        HStack(spacing: 1) {
                            Image("search")
                            Text("Искать анализы")
                                .foregroundColor(Color("DarkGray"))
                            Spacer()
                        }
                    }
                }.padding(.horizontal, 20)
                
                Spacer()
                
                VStack(spacing: 15) {
                    HStack {
                        Text("Акции и новости")
                            .font(.system(size: 17))
                            .bold()
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color("DarkGray"))
                        
                        Spacer()
                    }.padding(.horizontal, 20)
                                        
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(viewModel.news, id: \.self) { item in
                                
                                ZStack() {
                                    HStack() {
                                        Spacer()
                                        WebImage(url:
                                                    URL(string: item.image))
                                        
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 150)
                                        
                                    }.frame(width: 270)
                                        .background(Color("Cian"))
                                        .cornerRadius(12)
                                    
                                    VStack(spacing: 20) {
                                        
                                        Text(item.name)
                                            .foregroundColor(.white)
                                            .font(.custom("", size: 20))
                                            .bold()
                                            .frame(width: 200)
                                            .padding(.leading, 5)
                                            .padding(.trailing, 20)
                                            
                                            .multilineTextAlignment(.leading)
                                            
                                        
                                        VStack(spacing: 0) {
                                            
                                            Text(item.description)
                                                .font(.system(size: 10))
                                                .frame(width: 200)
                                                .foregroundColor(Color.white)
                                                .multilineTextAlignment(.leading)
                                            
                                            Text(item.price)
                                                .bold()
                                                .foregroundColor(.white)
                                                .multilineTextAlignment(.leading)
                                        }
                                    }
                                    
                                }
                                
                            }
                        }
                    }.padding(.leading, 20)
                        .background(Color.white)
                }
                
            }.onAppear(perform: viewModel.main)
            
            
            
            
            
            
        }
        
        
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
