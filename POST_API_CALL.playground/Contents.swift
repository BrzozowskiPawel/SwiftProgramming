import UIKit

func apiCall() {
    let stringURL = "https://jsonplaceholder.typicode.com/posts"
    guard let url = URL(string: stringURL) else {
        return
    }

    var request = URLRequest(url: url)

    //methods, body, headers
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")

    let body: [String: AnyHashable] = [
        "userId": 1,
        "title": "Hello from my won app",
        "body": "This is a html body ...",
    ]
    // http body
    request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)

    // Maka request
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data, error == nil else {
            return
        }

        do {
            let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            print(response)
        }catch {
            print(error)
        }
    }
    task.resume()
}


apiCall()
