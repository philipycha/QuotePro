//
//  QuoteViewController.swift
//  QuotePro
//
//  Created by Philip Ha on 2016-10-12.
//  Copyright © 2016 Philip Ha. All rights reserved.
//

import UIKit

class QuoteViewController: UIViewController {

    
    var quoteObject: Quote!
    var image: UIImage!
    var randomQuote:String!
    var author:String!
    var quoteView: QuoteView?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        quoteView = (Bundle.main.loadNibNamed("QuoteView", owner: self, options: nil)?[0] as! QuoteView)
        self.view.addSubview(quoteView!)
            
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
