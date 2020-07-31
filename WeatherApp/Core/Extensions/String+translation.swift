//
//  String+translation.swift
//  WeatherApp
//
//  Created by Work on 31/07/2020.
//  Copyright © 2020 Szymon Klimaszewski. All rights reserved.
//

import Foundation


extension String {
    
    func translate(args: CVarArg...) -> String{
        return String(format: NSLocalizedString(self, comment: ""), args)
    }
    
    func translate() -> String{
        return NSLocalizedString(self, comment: "")
    }
}
