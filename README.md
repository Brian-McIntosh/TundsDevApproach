# TundsDevApproach
1. Start by creating a Constants folder and an enum for our constants:
```swift
enum APIConstants {
    static let baseUrl = "https://animechan.vercel.app"
}
```


2. Create Feature Folders
image 1
* isolate features
* any files associated w/ say Login should go in that feature folder
    - model, vm, service, view
* high cohesion
image 2

3. Design Our Model
* model the API response
* make it singular not plural
* use let b/c we don't want someone to change it
```swift
struct Quote: Decodable {
    let anime: String
    let character: String
    let quote: String
}
```


4. Creating Dummy Data
* for unit testing
* to preview what things will look like b4 we hook up our service
```swift
extension Quote {
    static let dummyData: [Quote] = [
        Quote(anime: "Anime1", character: "Character1", quote: "Quote1"),
        Quote(anime: "Anime2", character: "Character2", quote: "Quote2"),
        Quote(anime: "Anime3", character: "Character3", quote: "Quote3"),
        Quote(anime: "Anime4", character: "Character4", quote: "Quote4"),
        Quote(anime: "Anime5", character: "Character5", quote: "Quote5"),
    ]
}
```


5. Create Our Screen in SwiftUI
* (personal change to call main screen a screen instead of view)
* "Screen" is a container for a group of views
image 3
* Now I can see what the UI looks like so I can fixing before interacting with the api


6. Refactor UI into Views





7. Design our Service



8. Design our ViewModel


9. Use ViewModel w/ @StateObject


10. Creating Base Views
