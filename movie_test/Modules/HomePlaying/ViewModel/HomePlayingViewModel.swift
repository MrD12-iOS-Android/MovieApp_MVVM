//
//  HomePlayingViewModel.swift
//  movie_test
//
//  Created by Dilshod Iskandarov on 3/10/22.
//

import Foundation

class NowPlayingViewModel {

    //MARK:- Properties
    private (set) var state: Bindable<FetchingServiceState> = Bindable(.loading)
    private let apiClient: APIClient
    private var searchResponse: SearchResponse?
    private (set) var nowPlayingList: Bindable<[Movie]> = Bindable([])
    private (set) var upcomingList: Bindable<[Movie]> = Bindable([])
    private (set) var topRatedList: Bindable<[Movie]> = Bindable([])
    private (set) var currentPage: Int = 1
    private (set) var totalPages: Int = Int.max

    //MARK:- init
    //init NowPlayingViewModel with dependency injection of network server client object
    //to be able to mock the network layer for unit testing
    init(apiClient: APIClient = APIClient()) {
        self.apiClient = apiClient
    }

    //MARK:- Helpers
    func fetchNowPlaying() {
        if currentPage > totalPages { return }
        state.value = .loading
        apiClient.getNowPlayingMovies(service: NowPlayingAPI(paramters: [NetworkConstants.pageParameterKey: "\(currentPage)"]), completion: { [weak self] response in
            self?.state.value = .finishedLoading
            switch response {
            case .success(let result):
                self?.nowPlayingList.value.append(contentsOf: result.movies)
                self?.totalPages = result.totalPages
                self?.currentPage += 1
            case .failure(let error):
                self?.state.value = .error(error)
            }
        })
    }
    func fetchUpcoming() {
        if currentPage > totalPages { return }
        state.value = .loading
        apiClient.getUpcomingMovies(service: APIUpcoming(paramters: [NetworkConstants.pageParameterKey: "\(currentPage)"]), completion: { [weak self] response in
            self?.state.value = .finishedLoading
            switch response {
            case .success(let result):
                self?.upcomingList.value.append(contentsOf: result.movies)
                self?.totalPages = result.totalPages
                self?.currentPage += 1
//                print("asdasdasdasd")
//                print(self?.upcomingList.value)
            case .failure(let error):
                self?.state.value = .error(error)
            }
        })
    }
    
    func fetchTopRated() {
        if currentPage > totalPages { return }
        state.value = .loading
        apiClient.getTopRatedMovies(service: APITopRated(paramters: [NetworkConstants.pageParameterKey: "\(currentPage)"]), completion: { [weak self] response in
            self?.state.value = .finishedLoading
            switch response {
            case .success(let result):
                self?.topRatedList.value.append(contentsOf: result.movies)
                self?.totalPages = result.totalPages
                self?.currentPage += 1
//                print("asdasdasdasd")
//                print(result.movies)
            case .failure(let error):
                self?.state.value = .error(error)
            }
        })
    }
}

