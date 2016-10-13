//
//  ViewController.swift
//  QuotePro
//
//  Created by Philip Ha on 2016-10-12.
//  Copyright © 2016 Philip Ha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var quoteView:QuoteView!
    var quoteObject: Quote!
    var image: UIImage!
    var randomQuote:String!
    var author:String!

    @IBOutlet weak var quoteButton: UIButton!
    @IBOutlet weak var imageButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var blankView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quoteView = Bundle.main.loadNibNamed("QuoteView", owner: self, options: nil)?[0] as! QuoteView
        self.view.addSubview(quoteView)
//        
//        self.view .bringSubview(toFront: quoteButton)
//        self.view .bringSubview(toFront: imageButton)
//        self.view .bringSubview(toFront: saveButton)
        
        view.bringSubview(toFront: blankView)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        
        let frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        quoteView.frame = frame

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func randomImage(_ sender: UIButton) {
        
        let url: URL = URL(string: "https://unsplash.it/750/1334/?random")!
        let session = URLSession.shared
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) -> Void in
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            if (statusCode == 200) {
                
                guard let data = data else {
                    return
                }
                
                self.image = UIImage(data: data)
                
                DispatchQueue.main.async(execute: {
                    
                    self.quoteView.photoView.image = self.image
                })
            }
            
        })
        task.resume()
    }

    @IBAction func randomQuote(_ sender: UIButton) {
        
        let url: URL = URL(string: "http://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json")!
        let session = URLSession.shared
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) -> Void in
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            if (statusCode == 200) {
                
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as! NSDictionary
                    
                    self.randomQuote = json["quoteText"] as! String
                    self.author = json["quoteAuthor"] as! String
                    DispatchQueue.main.async(execute: {
                        self.quoteView.quoteLabel.text = self.randomQuote
                        self.quoteView.authorLabel.text = self.author
                    })
                }
                catch {
                    print("Error with Json: \(error)")
                }
            }
            
        })
        task.resume()
}


    
//    @IBAction func saveImage(_ sender: UIButton) {
//        
//        
//    }

    


}
