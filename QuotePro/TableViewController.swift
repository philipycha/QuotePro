//
//  TableViewController.swift
//  QuotePro
//
//  Created by Philip Ha on 2016-10-12.
//  Copyright © 2016 Philip Ha. All rights reserved.
//

import UIKit
import Nuke


class TableViewController: UITableViewController, NewQuoteItem {
    
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
        
//        let url = URL(string: "https://unsplash.it/200/300/?random")!
//        
//        Nuke.loadImage(with: url, into: cell.cellImageView!)
        
        let quote = quotesLibrary[indexPath.row]
        
        cell.cellAuthorLabel.text = quote.author
        cell.cellQuoteLabel.text = quote.quote
        cell.cellImageView.image = quote.image
        
        return cell
        
    }
    
    func saveQuoteItem(quoteImageElement: Quote) {
        quotesLibrary.insert(quoteImageElement, at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .right)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toQuoteVC" {
            
            let nextVC = segue.destination as! ViewController
            
            nextVC.delegate = self
            
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let quote = quotesLibrary[indexPath.row]
        
        let qView = Bundle.main.loadNibNamed("QuoteView", owner: self, options: nil)?[0] as! QuoteView
        let frame = CGRect(x: -view.frame.width, y: 0, width: view.frame.width, height: view.frame.height)
        qView.frame = frame
        view.addSubview(qView)
        qView.authorLabel.text = quote.author
        qView.quoteLabel.text = quote.quote
        qView.photoView.image = quote.image
        
        let image = takeImage(view: qView)
        
        
        if let image = image {
            let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
            present(vc, animated: true)
        }else{
            //do something
        }
        
        qView.removeFromSuperview()
        
    }
    
    func takeImage(view imageView:UIView) -> (UIImage?) {
        
        UIGraphicsBeginImageContext(imageView.frame.size)
        let context = UIGraphicsGetCurrentContext()
        
        if let context = context {
            imageView.layer.render(in: context)
        }
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        return image
    }
    
    
    

}
