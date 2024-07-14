
import Foundation

struct MovieModel {
    let title: String
    let genre : MovieGenre
    private(set) var isFavorite : Bool
    
    func updateIsFavorite(newValue : Bool) -> MovieModel {
        return MovieModel(title: title, genre: genre, isFavorite: newValue)
    }
    
    mutating func updatingIsFavorite2 (newValue: Bool){
        isFavorite = newValue
    }
}

enum MovieGenre {
    case comedy, horror, action
}

class MovieManager {
 
    public var movie1 : MovieModel = MovieModel(title: "Avatar", genre: .action, isFavorite: false)
    
    private var movie2 : MovieModel = MovieModel(title: "Step Brothers", genre: .comedy, isFavorite: false)
    
    private(set) var movie3 : MovieModel = MovieModel(title: "Avengers", genre: .action, isFavorite: false)
    
    func updateMovie3(isFav : Bool) {
        movie3.updatingIsFavorite2(newValue: isFav)
    }
}

var manager = MovieManager()

var movie1 = manager.movie1
//var movie2 = manager.movie2
var movie3 = manager.movie3

// the movie1 is PUBLIC it can be set and get from the outside
movie1 = movie1.updateIsFavorite(newValue: true)
print(movie1)

// movie2 is private it cannot be set or get from the outside
//as it is PRIVATE
//movie2.updateIsFavorite(newValue: true)


// movie3 can be get from the outside but cannot set from the outside as it is PRIVATE SET
var movie3Title = movie3.title
manager.updateMovie3(isFav: true)
print(manager.movie3)
