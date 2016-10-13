//
//  TableViewController.swift
//  QuotePro
//
//  Created by Philip Ha on 2016-10-12.
//  Copyright © 2016 Philip Ha. All rights reserved.
//

import UIKit
import Nuke


class TableViewController: UITableViewController {
    
     var quotesLibrary:[Quote]=[]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
 
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return self.quotesLibrary.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> TableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        let url = URL(string: "https://unsplash.it/200/300/?random")!
        
        Nuke.loadImage(with: url, into: cell.cellImageView!)
        
        let quote = quotesLibrary[indexPath.row]
        
        cell.cellAuthorLabel.text = quote.author
        cell.cellQuoteLabel.text = quote.quote
        cell.cellImageView = UIImageView (image: quote.image)
        
        return cell
        
    }
    

}
