//
//  NetworkService.swift
//  Food_Ordering
//
//  Created by Huy Binh on 18/08/2022.
//

import Foundation

struct NetworkService {
    
    static let shared = NetworkService()
    
    private init(){}
    
    func myFirstRequest() {
        request(route: .temp, method: .post,parameters: ["username":"123","password":"123"], type: String.self) { _ in }
        print("Start")
    }
    
    private func request<T:Codable> (route : Route,
                                     method : Method,
                                     parameters : [String:Any]? = nil,
                                     type : T.Type ,
                                     completion : (Result<T,Error>) -> Void ) {
        guard let request = createRequest(route: route, method: method, parameters: parameters) else {
            completion(.failure(AppError.unknownError))
            return }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            var result : Result<Data, Error>?
            
            if let data = data {
                result = .success(data)
                let responseString = String(data : data, encoding: .utf8) ?? "Could not stringify data"
                print("responseString: \(responseString)")
            } else if let error = error {
                result = .failure(error)
                print("Error is : \(error.localizedDescription)")
            }
            DispatchQueue.main.async {
                // TODO: decode json and send to user
            }

        }.resume()
    }
    
    public func createRequest(route : Route,
                               method: Method,
                               parameters : [String:Any]? = nil) -> URLRequest? {
        
        let urlString = Route.baseUrl + route.description
        
        guard let url = URL(string: urlString) else {return nil}
        
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = method.rawValue
        
        if let params = parameters {
            switch method {
            case .get:
                var urlComponent = URLComponents(string: urlString)
                
                urlComponent?.queryItems = params.map {
                    URLQueryItem(name: $0, value: "\($1)") }
                urlRequest.url = urlComponent?.url
            case .post , .delete, .patch:
                let bodyData = try? JSONSerialization.data(withJSONObject: params, options: [])
                
                urlRequest.httpBody = bodyData
            }
        }
        return urlRequest
    }
}
