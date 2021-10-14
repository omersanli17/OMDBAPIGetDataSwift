//
//  ContentView.swift
//  FilmAramaSwiftUI
//
//  Created by omer sanli on 13.10.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button {
            DownloaderClient().filmleriIndir(search: "Pulp") { (sonuc) in
                switch sonuc {
                case .success(let filmDizisi):
                    print(filmDizisi)
              
                case .failure(let hata):
                    print(hata)
                }
                
                
            }
        } label: {
            Text("Test Yap")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
