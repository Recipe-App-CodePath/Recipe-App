import UIKit
import AFNetworking

class RecipeCell: UITableViewCell {

    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var usedIngredientCount: UILabel!
    @IBOutlet weak var missedIngredientCount: UILabel!

    var recipe: Recipe! {
        didSet{
            title.text = recipe.title
            usedIngredientCount.text = "\(recipe.usedIngredientCount)"
            missedIngredientCount.text = "\(recipe.missedIngredientCount)"
            
            if let url = recipe.imageUrl {
                recipeImageView.setImageWithURL(url)
            }
        }
    }
    
}
