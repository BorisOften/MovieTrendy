//
//  MainViewModel.swift
//  MovieTrending
//
//  Created by Boris Ofon on 1/13/23.
//

import Foundation

struct MainViewModel {
    
    
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfRows(in section: Int) -> Int {
        10
    }
    
    func getData()  {
        ApiCaller.getTrending { result in
            
            switch result {
                
            case .success(let movies):
                print(movies.results.count)
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
