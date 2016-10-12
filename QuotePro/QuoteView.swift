//
//  QuoteView.swift
//  QuotePro
//
//  Created by Philip Ha on 2016-10-12.
//  Copyright © 2016 Philip Ha. All rights reserved.
//

import UIKit

class QuoteView: UIView {

    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    
    func setupWithQuote(quote: Quote) {
        if let imageData = quote.quotePhoto?.image {
            photoView.image = UIImage(data: imageData as Data)
        }
        quoteLabel.text = quote.quoteText
        authorLabel.text = quote.quoteAuthor
    }
}
