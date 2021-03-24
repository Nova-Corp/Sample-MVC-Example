//
//  APIManager.swift
//  Music-Details-Design-Task
//
//  Created by ADMIN on 11/03/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import Foundation

class APIManager {
    static let shared = APIManager()
    private init() {}

    typealias CompletionBlock = (_ data: Data?, _ response: URLResponse, _ error: Error?) -> Void
    
    func fetchData(url: String, header: [String: String]?, method: String?, completion: @escaping CompletionBlock) {
        guard let url = URL(string: url) else {
            print("URL Not Valid.")
            return
        }
        var urlRequest = URLRequest(url: url)

        if let method = method {
            urlRequest.httpMethod = method
        }

        if let header = header {
            for param in header {
                urlRequest.addValue(param.value, forHTTPHeaderField: param.key)
            }
        }

        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in

            guard let response = response else { return }
            guard let data = data else { return }

            completion(data, response, error)
        }
        task.resume()
    }
}
