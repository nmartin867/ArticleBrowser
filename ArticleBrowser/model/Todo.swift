//
//  Todo.swift
//  ArticleBrowser
//
//  Created by Nick Martin on 1/11/18.
//  Copyright © 2018 MonkeyMan Technology. All rights reserved.
//

import Foundation

struct Todo: Codable {
    var title: String
    var id: Int?
    var userId: Int
    var completed: Int
    
    static func endpointForID(_ id: Int) -> String {
        return "https://jsonplaceholder.typicode.com/todos/\(id)"
    }
    
    static func todoByID(_ id: Int, completionHandler: @escaping (Todo?, Error?) -> Void) {
        // set up URLRequest with URL
        let endpoint = Todo.endpointForID(id)
        guard let url = URL(string: endpoint) else {
            print("Error: cannot create URL")
            let error = BackendError.urlError(reason: "Could not construct URL")
            completionHandler(nil, error)
            return
        }
        let urlRequest = URLRequest(url: url)
        
        // Make request
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest, completionHandler: {
            (data, response, error) in
            // handle response to request
            // check for error
            guard error == nil else {
                completionHandler(nil, error!)
                return
            }
            // make sure we got data in the response
            guard let responseData = data else {
                print("Error: did not receive data")
                let error = BackendError.objectSerialization(reason: "No data in response")
                completionHandler(nil, error)
                return
            }
            
            // parse the result as JSON
            // then create a Todo from the JSON
            
            let decoder = JSONDecoder()
            do {
                let todo = try decoder.decode(Todo.self, from: responseData)
                completionHandler(todo, nil)
            } catch {
                print("error trying to convert data to JSON")
                print(error)
                completionHandler(nil, error)
            }
        })
        task.resume()
    }
}
