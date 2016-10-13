//
//  Quote.swift
//  QuotePro
//
//  Created by Philip Ha on 2016-10-12.
//  Copyright © 2016 Philip Ha. All rights reserved.
//

import UIKit

class Quote {
    
    var quote: String
    var author: String
    var image: UIImage
    init(quote:String, author:String, image:UIImage) {
        self.quote = quote
        self.author = author
        self.image = image
        
    }
    
}
