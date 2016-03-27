import UIKit
import Alamofire

class RecipeFeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var recipeTableView: UITableView!
    
    var recipes: [Recipe]!
    
    let headers = [
        "X-Mashape-Key": "NHDnizUDH5mshbK6fNDHtFJAQRpDp1zYm3FjsnAVFgzGtVfsXi",
        "Accept": "application/json"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        recipeTableView.delegate = self
        recipeTableView.dataSource = self
        
        recipeTableView.rowHeight = UITableViewAutomaticDimension
        recipeTableView.estimatedRowHeight = 120
        
        // Parameters
        let ingredients = "Apple"
        //let limitLicense = false
        //let number = 4
        //let ranking = 1
        
        let requestUrl = NSURL(string: "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/findByIngredients?ingredients=\(ingredients)")
        
        // API Request
        Alamofire.request(.GET, requestUrl!, headers: headers, encoding: .JSON).responseJSON {
            response in switch response.result {
                
            //API Response
            case .Success:
                // JSON is retrieved
                
                //print("\(response.result.value!)")
                self.recipes = Recipe.recipesWithArray(response.result.value! as! [NSDictionary])
                // Now the issue is with loading the data we get into our recipes array. Uncomment both lines below to see error.
                //self.recipes = response.result.value! as! [Recipe]
                //print("\(self.recipes!)")
                self.recipeTableView.reloadData()
            case .Failure:
                print("\(response.description)")
                print("Request failed with error:")
            }
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if recipes != nil {
            return recipes.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = recipeTableView.dequeueReusableCellWithIdentifier("RecipeCell", forIndexPath: indexPath) as! RecipeCell
        cell.recipe = recipes[indexPath.row]
        return cell
    }

}
