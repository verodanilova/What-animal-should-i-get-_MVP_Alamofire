//
//  DataManager.swift
//  What animal should i get?
//
//  Created by Tanya on 18.02.2021.
//

import UIKit
import Alamofire

class NetworkManager {
    
    var session = ""
    
    
    func getQuestionsNetwork() {
        
        let idFile = "1jvtQz8jbQL43mZXgzl-tzSMAPwSygpiM"
        
        let url = URL(string: "https://www.googleapis.com/drive/v3/files/"+idFile+"/?key=AIzaSyB94CBGeUnPAElekWjSEGSeR8fsgcXp2X0"+"&alt=media")!
        AF.request(url)
            .validate()
            .responseData { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    print(value)
                    let decoder = JSONDecoder()
                   
                    
                    do {
                        let Questions = try decoder.decode([Question].self, from: value)
                     //    DispatchQueue.main.async {
                            print(Questions)
                     //     }
                    } catch {
                        print("error.localizedDescription")
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
}





//
//
// 3 - эта функция должна возвращать массив структур
// 4 - работа в фоне

//func alamofireGetButtonPressed() {
//  AF.request(URLExamples.exampleTwo.rawValue)
//   .validate()
//   .responseJSON { dataResponse in
//      switch dataResponse.result {
//      case .success(let value):
//        self.courses = Course.getCourses(from: value) ?? []
//      DispatchQueue.main.async {
//          self.tableView.reloadData()
//     }
//case .failure(let error):
//   print(error)
// }
