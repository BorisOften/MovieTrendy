//
//  MainViewModel.swift
//  MovieTrending
//
//  Created by Boris Ofon on 1/13/23.
//

import Foundation

class MainViewModel {
    
    var isLoading: Observable<Bool> = Observable(false)
    var cellDataSource: Observable<[MovieCellViewModel]> = Observable(nil)
    var dataSourse: Movies?
    
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfRows(in section: Int) -> Int {
        self.dataSourse?.results.count ?? 0
    }
    
    func getData()  {
        
        if isLoading.value ?? true {
            return
        }
        isLoading.value = true
        ApiCaller.getTrending {[weak self] result in
            self?.isLoading.value = false
            
            switch result {
            case .success(let movies):
                print(movies.results.count)
                self?.dataSourse = movies
                self?.mapCellData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func mapCellData() {
        cellDataSource.value = dataSourse?.results.compactMap({ MovieCellViewModel(movie: $0)
        })
        
    }
    
    func getMovieTitle(_ movie: MoviesResult) -> String{
        return movie.title ?? movie.name ?? ""
    }
}
