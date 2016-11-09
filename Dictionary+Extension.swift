//
//  Dictionary+Extension.swift
//  Zupamart
//
//  Created by Alexander Gerasimov on 11/9/16.
//  Copyright © 2016 zfort. All rights reserved.
//

import UIKit

extension Dictionary where Key: ExpressibleByStringLiteral, Value: Any
{
    func valueFor(_ key: String) -> Any?
    {
        
        for (keyIn,value) in self
        {
            if let string = keyIn as? String, string == key
            {
                return value
            }
        }
        
        return nil
    }
    
    func intFor(key: String) -> Int?
    {
        if let val = valueFor(key) as? Int
        {
            return val
        }
        
        if let val = valueFor(key) as? String
        {
            if let intVal = Int(val)
            {
                return intVal
            }
        }
        
        return nil
    }
    
    func stringFor(key: String) -> String?
    {
        if let val = valueFor(key) as? String
        {
            return val;
        }
        
        return nil
    }
    
    func doubleFor(key: String) -> Double
    {
        if (self.valueFor(key) as? Double) != nil
        {
            return self.valueFor(key) as! Double;
        }
        else
        {
            if (self.valueFor(key) as? String) != nil
            {
                let val = self.valueFor(key) as! String
                
                if Double(val) != nil
                {
                    return Double(val)!;
                }
            }
        }
        
        return 0;
    }
    
    func arrayFor(key: String) -> [Any]?
    {
        if let val = self.valueFor(key) as? [Any]
        {
            return val
        }
        
        return nil;
    }
    
    func arrayOfDictionariesFor(key: String) -> [[String:Any]]?
    {
        if let val = self.valueFor(key) as? [[String:Any]]
        {
            return val
        }
        
        return nil;
    }
    
    func dictionaryStringAnyFor(key: String) -> [String:Any]?
    {
        if let val = self.valueFor(key) as? [String:Any]
        {
            return val
        }
        else
        {
            return [String:Any]()
        }
    }

}
