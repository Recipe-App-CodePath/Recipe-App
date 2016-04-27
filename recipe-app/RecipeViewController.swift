//
//  RecipeViewController.swift
//  recipe-app
//
//  Created by Lilian Ngweta on 4/12/16.
//  Copyright © 2016 Sosuke. All rights reserved.
//

import UIKit
import Alamofire


class RecipeViewController: UIViewController {
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var recipeLabel: UILabel!
    
    var recipe: Recipe!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
//        let requestUrl = NSURL(string: "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/\(recipe.id)/summary")
////        let requestUrl = NSURL(string: "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/mealplans/generate?targetCalories=2000&timeFrame=day")
//        
//        // API Request
//        Alamofire.request(.GET, requestUrl!, headers: headers, encoding: .JSON).responseJSON {
//            response in switch response.result {
//                
//                //API Response
//            case .Success:
//                // JSON is retrieved
//                
//                //print("\(response.result.value!)")
//                if let dictionary = response.result.value! as? NSDictionary {
//                    self.recipe.summary = dictionary["summary"] as? String
//                    self.recipeLabel.text = self.recipe.summary
//                }
//                
//            case .Failure:
//                print("\(response.description)")
//                print("Request failed with error:")
//            }
//        }
        
        
        if let id = recipe.id {
            
            let requestUrl = NSURL(string: "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/\(id)/summary")
            
            
            // API Request
            Alamofire.request(.GET, requestUrl!, headers: headers, encoding: .JSON).responseJSON {
                response in switch response.result {
                    
                    //API Response
                case .Success:
                    // JSON is retrieved
                    
                    if let dictionary = response.result.value! as? NSDictionary {
                        self.recipe.summary = dictionary["summary"] as? String
                        self.recipeLabel.text = self.recipe.summary
                    }
                case .Failure:
                    print("\(response.description)")
                    print("Request failed with error:")
                }
            }
        }
        
        
        let title = recipe.title
        
        titleLabel.text = title
        
        let summary = recipe.summary
        recipeLabel.text = summary
        
        let posterImage = recipe.imageUrl
        posterImageView.setImageWithURL(posterImage!)

        
        print(recipe.title)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.

    }
    */

}
