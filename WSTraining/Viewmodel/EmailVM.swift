//
//  EmailVM.swift
//  WSTraining
//
//  Created by Глеб Голощапов on 05.04.2023.
//

import Foundation
import Alamofire
import SwiftyJSON

class EmailVM: ObservableObject {
    
    func sendCode(email: String, completion: @escaping (String) -> Void) {
        
        let url = "https://medic.madskill.ru/api/sendCode"
        
        let header: HTTPHeaders = [ "email": email ]
        
        AF.request(url, method: .post, headers: header).validate().response { response in
            switch response.result {
            case .success(let value):
                let answer = JSON(value!)
                completion(answer["message"].stringValue)
            case .failure(let error):
                print(error.localizedDescription)
                completion(error.localizedDescription)
            }
        }
        
        
    }
    
}
