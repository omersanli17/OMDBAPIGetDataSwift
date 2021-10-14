//
//  DownloaderClient.swift
//  FilmAramaSwiftUI
//
//  Created by omer sanli on 13.10.2021.
//

import Foundation

class DownloaderClient {
    func filmleriIndir(search : String, completion: @escaping (Result<[Film]?, DownloaderError>) -> Void ) {
        
        guard let url = URL(string: "https://www.omdbapi.com/?s=\(search)&apikey=92024da1")
        else{
            return completion(.failure(.yanlisURL))
        }
  
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.veriGelmedi))
        }
            
            guard let filmCevabi = try? JSONDecoder().decode(GelenFilmler.self, from: data) else {
                return completion(.failure(.veriIslenemedi))
            }
            
            completion(.success(filmCevabi.filmler))
            
        
            
        }.resume()
    }
}

enum DownloaderError : Error {
    case yanlisURL
    case veriGelmedi
    case veriIslenemedi
}
