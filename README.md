# My SwiftUI Async Await MVVM Project Structure & Approach
## 1. Start by creating a Constants folder and an enum for our constants:
```swift
enum APIConstants {
    static let baseUrl = "https://animechan.vercel.app"
}
```
Why didn't we use a struct? (...essentially the same)
1. don't want someone to instantiate this object
2. can't really create an instance of an enum
3. like a namespace for our properties


## 2. Create Feature Folders
Imagine you have the following sections in your app:

<img src="https://github.com/Brian-McIntosh/TundsDevApproach/blob/main/images/1.png" width="400"/>
You want:

* To isolate features
* To group any files associated w/ the feature
    - Model, ViewModel, Service, View
* To have high cohesion
<img src="https://github.com/Brian-McIntosh/TundsDevApproach/blob/main/images/4.png" width="300"/>


## 3. Design Our Model
```swift
struct Quote: Decodable {
    let anime: String
    let character: String
    let quote: String
}
```
* model the API response
* make it singular not plural
* use let b/c we don't want someone to change it


## 4. Creating Dummy Data
Why?
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


## 5. Create Our Screen in SwiftUI
* (personal change to call main screen a screen instead of view)
* "Screen" is a container for a group of views
<img src="https://github.com/Brian-McIntosh/TundsDevApproach/blob/main/images/3.png" width="300"/>
* Great, now I can see what the UI looks like even before creating our service to call an API



## 6. Refactor UI into Views
```swift
// Main Screen
List {
    ForEach(Quote.dummyData, id: \.anime) { item in
        QuoteView(item: item)
    }
}

// QuoteView
// (refactored from forEach loop on main screen)
VStack(alignment: .leading, spacing: 8) {
    HStack {
        Image(systemName: "tv")
            .font(.system(size: 12, weight: .black))
        Text(item.anime)
    }
    
    Text(item.character)
    Text(item.quote)
}
```


## 7. Design our Service
This approach (protocol/protocol implementation) allows us to fake our service or viewmodel class for unit testing.
```swift
protocol QuotesService {
    func fetchRandomQuotes() async throws -> [Quote]
}

// final means nobody can subclass it
final class QuotesServiceImpl: QuotesService {
    func fetchRandomQuotes() async throws -> [Quote] {
        let urlSession = URLSession.shared
        let url = URL(string: APIConstants.baseUrl.appending("/api/quotes"))
        let (data, _) = try await urlSession.data(from: url!)
        return try JSONDecoder().decode([Quote].self, from: data)
    }
}
```


## 8. Design our ViewModel
The ViewModel will interact with our Service, but it also allows us to do additional business logic such as:
* rearranging the data (sorting, filtering)
* caching the data
* etc
```swift
protocol QuotesViewModel: ObservableObject {
    func getRandomQuotes() async 
}

@MainActor
final class QuotesViewModelImpl: QuotesViewModel {

    @Published private(set) var quotes: [Quote] = []
    
    private let service: QuotesService
    
    init(service: QuotesService) {
        self.service = service
    }
    
    func getRandomQuotes() async {
        do {
            self.quotes = try await service.fetchRandomQuotes()
        } catch {
            print(error)
        }
    }
}
```

## Use ViewModel w/ @StateObject
```swift
struct QuotesScreen: View {
    
    @StateObject private var vm = QuotesViewModelImpl(service: QuotesServiceImpl())
    
    var body: some View {
        List {
//            ForEach(Quote.dummyData, id: \.anime) { item in
//                QuoteView(item: item)
//            }
            ForEach(vm.quotes, id: \.anime) { item in
                QuoteView(item: item)
            }
        }
        .task {
            await vm.getRandomQuotes()
        }
    }
}
```


## Creating Base Views
