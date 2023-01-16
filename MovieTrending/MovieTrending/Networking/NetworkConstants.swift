//
//  NetworkConstants.swift
//  MovieTrending
//
//  Created by Boris Ofon on 1/15/23.
//

import Foundation

class NetworkConstants {
    
    public static var shared = NetworkConstants()
    
    private init() {
        // Singleton initializer. so no other class can access it
    }
    
    public var apiKey: String {
        get {
            // Api key from codePath. only valid on some request
            return "a07e22bc18f5cb106bfe4cc1f83ad8ed"
        }
    }
    
    public var serverAdress: String {
        get {
            return "https://api.themoviedb.org/3/"
        }
    }
    
    public var imageServerAddress: String {
        get {
            return "https://image.tmdb.org/t/p/w500/"
        }
    }
}
