//
//  SearchViewController.swift
//  ClotheSearch
//
//  Created by Libranner Leonel Santos Espinal on 7/7/16.
//  Copyright © 2016 Libranner Leonel Santos Espinal. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    var results = (brands:[String], clothingTypes: [String], searchQuery: String)([],[], "")
    
    @IBOutlet weak var searchTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func searchButtonTapped(sender: AnyObject) {
        let searchQuery = searchTextField.text!
        if(!searchQuery.isEmpty){
            results = SearchEngine().search(searchQuery)
            self.performSegueWithIdentifier("showResults", sender: self)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "showResults"){
            let destination = segue.destinationViewController as! SearchResultTableViewController
            destination.brandResults = results.brands
            destination.clothingTypeResults = results.clothingTypes
            destination.searchQuery = results.searchQuery
        }
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
