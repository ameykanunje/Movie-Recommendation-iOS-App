import Foundation
import OpenAIKit


class RecommendViewModel: ObservableObject {
    private var openai: OpenAI?
    //@Published var movieName: String?
    @Published var recommendedMovie: [Recommended] = []

//    func setup() {
//        openai = OpenAI(Configuration(
//            organizationId: "Personal",
//            apiKey: "sk-proj-wRaqzGtuEtf6klcgAc1hT3BlbkFJYfxvzFZmfSirs4lkgRDK"))
//    }

    func generateMovie(movieName : String) async{
        print("In generate Movie")
        print(movieName)
        let jsonBody : [String: Any] = [
          "model" : "gpt-3.5-turbo",
          "prompt": "Given the movie name: \(movieName), suggest four similar movies in the following JSON format:\n\n{\n  \"movies\": [\n    {\n      \"title\": \"Movie Title\",\n      \"year\": \"Year of Release\"\n    },\n    {\n      \"title\": \"Movie Title\",\n      \"year\": \"Year of Release\"\n    },\n    {\n      \"title\": \"Movie Title\",\n      \"year\": \"Year of Release\"\n    },\n    {\n      \"title\": \"Movie Title\",\n      \"year\": \"Year of Release\"\n    }\n  ]\n}",
          "max_tokens": 200,
          "temperature": 0.7,
          "top_p": 1,
          "frequency_penalty": 0,
          "presence_penalty": 0
        ]

        // Replace with your OpenAI API key
        let apiKey = "API_KEY"

        guard let url = URL(string: "https://api.openai.com/v1/completions") else {
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpBody = prompt.data(using: .utf8)
        
        if let jsonData = try? JSONSerialization.data(withJSONObject: jsonBody, options: []) {
            request.httpBody = jsonData
        } else {
            print("Error encoding JSON payload")
            return
        }

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            print("Data -> \(data)")
            if let data = data {
                do {
                    let responseJSON = try JSONSerialization.jsonObject(with: data, options: [])
                    //print(responseJSON)
                    if let responseJSON = responseJSON as? [String: Any],
                       let choices = responseJSON["choices"] as? [[String: Any]],
                       let text = choices.first?["text"] as? String {
                        if let movieData = text.data(using: .utf8),
                           let jsonObject = try? JSONSerialization.jsonObject(with: movieData, options: []) as? [String: Any],
                           let movies = jsonObject["movies"] as? [[String: Any]] {
                            // Process the "movies" array and store it in your model instance
                            //print(movies)
                        }
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }

        task.resume()
    }
}


/*
 {
     print("In generate Movie\(movieName), \(openai)")
     guard let openai = openai else {
         return
     }

     let prompt = """
     Generate 5 movie recommendations based on \(movieName) in JSON format.

     {
       "movies": [
         {
           "name": "[Movie Name 1]",
           "year": "[Year 1]"
         },
         {
           "name": "[Movie Name 2]",
           "year": "[Year 2]"
         },
         {
           "name": "[Movie Name 3]",
           "year": "[Year 3]"
         },
         {
           "name": "[Movie Name 4]",
           "year": "[Year 4]"
         },
         {
           "name": "[Movie Name 5]",
           "year": "[Year 5]"
         }
       ]
     }
     """
     print("OutSide Do Block")
     do {
         print("In do block")
         
         let parameters = CompletionParameters(model: "text-davinci-003", prompt: [prompt], maxTokens: 500)
         print(parameters)
         // Generate movie recommendations asynchronously
         let response = try await openai.generateCompletion(parameters: parameters)

         // Parse JSON response into model
         let responseData = response.choices[0].text.data(using: .utf8)!
         print(responseData)
         let movieRecommendations = try JSONDecoder().decode(Recommended.self, from: responseData)
         print("Movie Recom after Decoding\(movieRecommendations)")
         recommendedMovie = [movieRecommendations]
     } catch {
         // Handle error
         print("Error: \(error)")
         
     }
 }
 */
