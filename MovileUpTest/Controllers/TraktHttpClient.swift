//
//  TraktHttpClient.swift
//  MovileUpTest
//
//  Created by Caique Moreira on 22/07/15.
//  Copyright (c) 2015 Movile. All rights reserved.
//

import Foundation
import Alamofire
import Result

class TraktHTTPClient {
    
    private lazy var manager: Alamofire.Manager = {
        let configuration: NSURLSessionConfiguration = {
            var configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
            
            var headers = Alamofire.Manager.defaultHTTPHeaders
            headers["Accept-Encoding"] = "gzip"
            headers["Content-Type"] = "application/json"
            headers["trakt-api-version"] = "2"
            headers["trakt-api-key"] = "9a8e9d1179bbb08218603ee8d4822cee0ef83dd7e7f59f1e3182f2948e962cad"
            
            configuration.HTTPAdditionalHeaders = headers
            
            return configuration
        }()
        
        return Manager(configuration: configuration)
    }()
    
    private enum Router: URLRequestConvertible {
        static let baseUrlString = "https://api-v2launch.trakt.tv/"
        
        case Show(String)
        case PopularShows()
        case Seasons(String)
        case Season(String, Int)
        case Episode(String, Int, Int)
        case Episodes(String, Int)

        // MARK: - URLRequestConvertible
        var URLRequest: NSURLRequest {
            let (path: String, parameters: [String: AnyObject]?, method: Alamofire.Method) = {
                switch self {
                    case .Show(let slug):
                        return ("shows/\(slug)", ["extended": "full,images"], .GET)
                    case .PopularShows():
                        return ("shows/popular", ["extended" : "full,images"], .GET)
                    case .Seasons(let slug):
                        return ("shows/\(slug)/seasons", ["extended" : "full,images"], .GET)
                    case let .Season(slug, season):
                        return ("shows/\(slug)/seasons", ["extended" : "full,images"], .GET)
                    case let .Episode(slug, season, episode):
                        return ("shows/\(slug)/seasons/\(season)/episodes/\(episode)", ["extended" : "full, images"], .GET)
                    case let .Episodes(slug, season):
                        return ("shows/\(slug)/seasons/\(season)/episodes", ["extended" : "full, images"], .GET)
                }
            }()
            
            let URL = NSURL(string: Router.baseUrlString)!
            let URLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(path))
            URLRequest.HTTPMethod = method.rawValue
            
            let encoding = Alamofire.ParameterEncoding.URL
            
            return encoding.encode(URLRequest, parameters: parameters).0
        }
    }
    
    private func getJSONElement<T: JSONDecodable>(router: Router, completion: ((Result<T, NSError?>) -> Void)?) {
        manager.request(router).validate().responseJSON { (_, _, responseObject, error) in
            if let json = responseObject as? NSDictionary {
                if let value = T.decode(json) {
                    completion?(Result.success(value))
                } else {
                    completion?(Result.failure(nil))
                }
            } else {
                completion?(Result.failure(error))
            }
        }
    }
    
    private func getJSONElementArray<T : JSONDecodable>(router: Router, completion: ((Result<[T], NSError?>) -> Void)?) {
        manager.request(router).validate().responseJSON { (_, _, responseObject, error) in
            if let jsonArray = responseObject as? NSArray {
                var array : [T] = []
                
                for element in jsonArray {
                    if let parsedElement = T.decode(element) {
                        array.append(parsedElement)
                    }
                }
                completion?(Result.success(array))
                
            } else {
                completion?(Result.failure(error))
            }
        }
    }

    func getShow(slug: String, completion: ((Result<Show, NSError?>) -> Void)?) {
        return getJSONElement(Router.Show(slug), completion: completion)
    }
    
    func getPopularShows(completion: ((Result<[Show], NSError?>) -> Void)?) {
        return getJSONElementArray(Router.PopularShows(), completion: completion)
    }
    
    //func getSeasons(slug: String, completion ((Result<)))
    
}
