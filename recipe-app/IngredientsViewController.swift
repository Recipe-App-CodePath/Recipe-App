import UIKit
import KSTokenView


class IngredientsViewController: UIViewController, KSTokenViewDelegate {

    @IBOutlet weak var tokenView: KSTokenView!

    let names: Array<String> = IngredientList.names()
    var ingredients: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ingredients = []
        
        tokenView.delegate = self
        tokenView.promptText = ""
        tokenView.placeholder = "Type ingredients here"
        tokenView.descriptionText = "Ingredients"
        tokenView.maxTokenLimit = -1 //Infinite token limit
        tokenView.style = .Rounded
    }
    
    func tokenView(token: KSTokenView, performSearchWithString string: String, completion: ((results: Array<AnyObject>) -> Void)?) {
        var data: Array<String> = []
        
        for value: String in names {
            if value.lowercaseString.rangeOfString(string.lowercaseString) != nil {
                data.append(value)
            }
        }
        completion!(results: data)
    }
    
    func tokenView(token: KSTokenView, displayTitleForObject object: AnyObject) -> String {
        return object as! String
    }
    
    func tokenView(tokenView: KSTokenView, didAddToken token: KSToken) {
        ingredients!.append(token.title)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SegueIngredients" {
            if let destination = segue.destinationViewController as? RecipeFeedViewController {
                destination.ingredients = ingredients
            }
        }
    }
    
}
