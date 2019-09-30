import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

// This homework should be fairly simple.
// visit https://github.com/noops-challenge/wordbot to read
// the documentation for wordbot.
//
// Using that documentation, write a playground that does
// the following:
// download 50 words
// decode those 50 words into an array of strings
// print the array of words, but with each word reversed
// print the average number of characters per word


struct WordList: Codable {
    let words: [String]
}

let urlString = "https://api.noopschallenge.com/wordbot?count=50"

if let url = URL(string: urlString){
    
    let request = URLRequest(url: url)
    let session = URLSession(configuration: .ephemeral)
    let task = session.dataTask(with: request) {(data, response, error) in
        //the data type just handles blobs of data
        let wordList = try! JSONDecoder().decode(WordList.self, from: data!)
        var totalCharacters = 0
        for word in wordList.words{
            print(String(word.reversed()))
            totalCharacters += word.count
            }
        let averageCharactersPerWord = totalCharacters / 50
        print("The average amount of characters per word is: \(averageCharactersPerWord)")
    }
    
    task.resume()
}



