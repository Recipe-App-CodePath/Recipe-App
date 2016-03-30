import UIKit
import KSTokenView


class IngredientsViewController: UIViewController, KSTokenViewDelegate {

    @IBOutlet weak var tokenView: KSTokenView!

    let names: Array<String> = IngredientList.names()
    var ingredients: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tokenView.delegate = self
        tokenView.promptText = ""
        tokenView.placeholder = "Type ingredient"
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
        // Returns the autocomplete list
        //print("\(object)")
        return object as! String
    }
    
    func tokenView(tokenView: KSTokenView, didAddToken token: KSToken) {
        ingredients?.append("Apple")
        //token.title
        print("Added ingredients: \(ingredients?.count)")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SegueIngredients" {
            if let destination = segue.destinationViewController as? IngredientsViewController {
                destination.ingredients = ingredients
            }
        }
    }
    
}
