import Foundation

// Dictionay contains of a key and value pair
// we can traverse dictionary using the keys
// keys must be unique
// app mever crash if we dont found the value related to specific key
// nil is returned if the value is not found
var myFirstDict : [String:String] = [
    "abc" : "Apple",
    "def" : "Banana",
    "ghi" : "Mango"
]

if let apples = myFirstDict["abc"] {
    print(apples)
}

struct PostModel {
    let id : String
    let title: String
    let likes : Int
}


// this is an array of custom data type
var PostArray : [PostModel] = [
    PostModel(id: "abc", title: "Post1", likes: 11),
    PostModel(id: "def", title: "Post2", likes: 113),
    PostModel(id: "fed", title: "Post3", likes: 112)
]

// this is an dictionary of post with type PostModel
var PostDict : [String: PostModel] = [
    "abc" : PostModel(id: "abc", title: "Post1", likes: 11),
    "def" : PostModel(id: "def", title: "Post2", likes: 114),
    "ghi" : PostModel(id: "ghi", title: "Post3", likes: 113),
]

print(PostDict)
                    
