//
//  MenuBoardManager.swift
//  Sulasang
//
//  Created by 한지석 on 2023/09/10.
//

import Foundation

enum NetworkError: Error {
    case networkingError
    case dataError
    case parseError
    case urlError
}

final class MenuBoardManager {
    //
    typealias NetworkCompletion = (Result<[DateAndTypeDietInfoDTO], NetworkError>) -> Void
    
    var baseURL = "http://13.209.94.162:8080"
    
    func fetchData(completion: @escaping NetworkCompletion) {
        print(#function)
        performRequest(with: baseURL + "/v1/diet") { result in
            completion(result)
        }
    }
    
    func performRequest(with urlString: String, completion: @escaping NetworkCompletion) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        let dateString = dateFormatter.string(from: Date())
        
        var urlComponents = URLComponents(string: urlString)
        urlComponents?.queryItems = [
            URLQueryItem(name: "type", value: "LUNCH"),
            URLQueryItem(name: "date", value: dateString)
        ]

        guard let requestURL = urlComponents?.url else {
            completion(.failure(.urlError))
            return
        }
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: requestURL) { data, response, error in
            if error != nil {
                print("@Log error - \(String(describing: error?.localizedDescription))")
                completion(.failure(.networkingError))
                return
            }
            
            guard let data = data else {
                print("@Log data error")
                completion(.failure(.dataError))
                return
            }
        
            if let menu = self.parseJSON(data) {
                completion(.success(menu.result.dateAndTypeDietInfo))
            } else {
                completion(.failure(.parseError))
            }
            
        }
        task.resume()
    }
    
    private func parseJSON(_ menuData: Data) -> MenuBoardResponseDTO? {
        print(#function)
        do {
            let menuData = try JSONDecoder().decode(MenuBoardResponseDTO.self, from: menuData)
            return menuData
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
}
