//
//  MainVM.swift
//  WSTraining
//
//  Created by Глеб Голощапов on 10.04.2023.
//

import Foundation
import Alamofire
import SwiftyJSON


struct News: Hashable {
    var price, name, description, image: String
    var id: Int
}

class MainVM: ObservableObject {
    
    
    @Published var news: [News] = []
    
    func main() {
        getNews()
        getCatalog()
    }
    
    func getNews() {
        let url = "https://medic.madskill.ru/api/news"
        
        AF.request(url, method: .get).validate().response { [self] response in
            switch response.result {
            case .success(let value):
                let answer = JSON(value!)
                for i in answer {
                    
                    if i.0 == "0" {
                        news.append(News(price: i.1["price"].stringValue, name: i.1["name"].stringValue, description: i.1["description"].stringValue, image: i.1["image"].stringValue, id: i.1["id"].intValue))
                        
                    } else {
                        var image = i.1["image"].stringValue
                        let x = image.split(separator: " ")
                        
                        image = x[0] + "%20" + x[1]
                        
                        news.append(News(price: i.1["price"].stringValue, name: i.1["name"].stringValue, description: i.1["description"].stringValue, image: image, id: i.1["id"].intValue))
                        
                    }
                    
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getCatalog() {
        let url = "https://medic.madskill.ru/api/catalog"
        
        AF.request(url, method: .get).validate().response { response in
            switch response.result {
            case .success(let value):
                let answer = JSON(value!)
                print(answer)
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}

