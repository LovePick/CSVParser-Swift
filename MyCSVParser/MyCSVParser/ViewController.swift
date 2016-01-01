//
//  ViewController.swift
//  MyCSVParser
//
//  Created by supapon pucknavin on 1/1/2559 BE.
//  Copyright © 2559 supapon pucknavin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func viewDidAppear(animated: Bool) {
        let data = CSVParser.shatedInstance.loadConversationListWithFileName(FileName: "001_Greetings", ofType: "csv")
        
        print(data.count)
        print("\(data.first?.arString[0])")
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

