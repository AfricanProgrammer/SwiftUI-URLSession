//
//  ContentView.swift
//  SwiftUIUrlSessionByNyashaMadzokere
//
//  Created by User on 2022/08/15.
//

import SwiftUI

struct Quotes: Codable {
    var id: Int
    var quote: String
    var author: String
    var series: String
    
}

struct ContentView: View {
    @State private var quotes = [Quotes]()
    var body: some View {
        NavigationView {
            List(quotes, id: \.id) {
                quote in
                VStack(alignment: .leading) {
                    Text(quote.author)
                        .font(.headline)
                    Text(quote.quote)
                        .font(.body)
                }
            }
            .navigationTitle("Quotes")
            .task {
                await fetchData()
            }
        }
    }
        
        
    


func fetchData() async {
    //call the data
    guard let url = URL (string: "") else {
        print("Lets break, up its not https://www.breakingbadapi.com/api/quotes ")
        return
    }
    do {
        let (data, _) = try await URLSession.shared.data(from: url)
        
        if let decodedRespone = try? JSONDecoder().decode([Quotes].self, from: data) {
            quotes = decodedRespone
        }
    } catch{
        print("bad news.... this data isnt valid")
    }
}
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
