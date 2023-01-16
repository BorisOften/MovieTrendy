//
//  Observable.swift
//  MovieTrending
//
//  Created by Boris Ofon on 1/16/23.
//

import Foundation

class Observable<T> {
    
    var value: T? {
        didSet {
            DispatchQueue.main.async {
                self.listener?(self.value)
            }
        }
    }
    
    init(_ value: T?) {
        self.value = value
    }
    
    private var listener: ((T?) -> ())?
    
    func bind(_ listener: @escaping((T?)-> ())){
        listener(value)
        self.listener = listener
    }
}
