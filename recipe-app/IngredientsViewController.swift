//
//  IngredientsViewController.swift
//  recipe-app
//
//  Created by Julio Hernandez-Duran on 3/29/16.
//  Copyright © 2016 Sosuke. All rights reserved.
//

import UIKit
import KSTokenView


class IngredientsViewController: UIViewController, KSTokenViewDelegate {

    @IBOutlet weak var tokenView: KSTokenView!
    
    let names: Array<String> = IngredientList.names()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tokenView.delegate = self
        tokenView.promptText = "Top 5: "
        tokenView.placeholder = "Type to search"
        tokenView.descriptionText = "Languages"
        tokenView.maxTokenLimit = 5
        tokenView.style = .Squared
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

}
