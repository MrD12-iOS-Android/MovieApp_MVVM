//
//  HomePlayingAPITopRated.swift
//  movie_test
//
//  Created by Dilshod Iskandarov on 3/11/22.
//

import Foundation
class APITopRated: Service {
    
    var paramters: [String: String]?

    init(paramters: [String: String]?) {
        self.paramters = paramters
        self.paramters?.append(dict: NetworkConstants.defaultRequestParams)
    }

    var baseURL: URL {
        return URL(string: NetworkConstants.baseURL)!
    }

    var path: String {
        return NetworkConstants.topRatedServicePath
    }
    var method: HTTPMethod {
        return .get
    }

    var task: Task {
        return .requestParameters(self.paramters ?? [:])
    }

    var headers: RequestHeaders? {
        return NetworkConstants.defaultRequestHeaders
    }

    var parametersEncoding: ParametersEncoding {
        return .url
    }
}

protocol APITopRatedService {
    func getTopRatedMovies(service: Service, completion: @escaping (_ result: APIResponse<NowPlayingResponse>) -> ())
}
