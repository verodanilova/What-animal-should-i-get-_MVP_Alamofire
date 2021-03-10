//
//  DataManager.swift
//  What animal should i get?
//
//  Created by Tanya on 18.02.2021.
//

import UIKit
import Alamofire

    extension Question {
        
        static func getQuestionsNetwork(completionHandler: @escaping ([Question]?) -> Void) {
            
            let idFile = "1jvtQz8jbQL43mZXgzl-tzSMAPwSygpiM"
            
            let url = URL(string: "https://www.googleapis.com/drive/v3/files/"+idFile+"/?key=AIzaSyB94CBGeUnPAElekWjSEGSeR8fsgcXp2X0"+"&alt=media")!
            AF.request(url)
                .validate()
                .responseData { dataResponse in
                    switch dataResponse.result {
                    case .success(let value):
                        
                        let decoder = JSONDecoder()
                        
                        do {
                            let questionsFromJSON = try decoder.decode([Question].self, from: value)
                            print(questionsFromJSON)
                            DispatchQueue.main.async {
                                completionHandler(questionsFromJSON)
                            }
                        } catch {
                            print("error.localizedDescription")
                        }
                    case .failure(let error):
                        print(error)
                    }
                }
        }
    }
