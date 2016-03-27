import UIKit

class Recipe: NSObject {
    let id: Int?
    let usedIngredientCount: Int?
    let missedIngredientCount: Int?
    let title: String?
    let imageUrl: NSURL?
    
    init(dictionary: NSDictionary) {
        id = dictionary["id"] as? Int
        usedIngredientCount = dictionary["usedIngredientCount"] as? Int
        missedIngredientCount = dictionary["missedIngredientCount"] as? Int
        title = dictionary["title"] as? String
        
        let imageUrlString = dictionary["image"] as? String
        
        if imageUrlString != nil {
            imageUrl = NSURL(string: imageUrlString!)
        } else {
            imageUrl = nil
        }
    }
    
    class func recipesWithArray(dictionaries: [NSDictionary]) -> [Recipe] {
        var recipes = [Recipe]()
        
        for dictionary in dictionaries {
            let recipe = Recipe(dictionary: dictionary)
            recipes.append(recipe)
        }
        return recipes
    }
}
