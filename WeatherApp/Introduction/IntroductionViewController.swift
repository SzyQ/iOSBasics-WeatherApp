//
//  IntroductionViewController.swift
//  WeatherApp
//
//  Created by Work on 31/07/2020.
//  Copyright © 2020 Szymon Klimaszewski. All rights reserved.
//

import UIKit

@objcMembers class IntroductionViewController: UIViewController {

    @IBOutlet weak var introLabel: UILabel!
    
    var name: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        introLabel.text = name
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
