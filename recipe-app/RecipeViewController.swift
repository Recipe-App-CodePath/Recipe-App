//
//  RecipeViewController.swift
//  recipe-app
//
//  Created by Lilian Ngweta on 4/12/16.
//  Copyright © 2016 Sosuke. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController {
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var recipeLabel: UILabel!
    
    var recipe: NSDictionary!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print(recipe)

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
