//
//  Dictionary+Extension.swift
//  Zupamart
//
//  Created by Alexander Gerasimov on 11/9/16.
//  Copyright © 2016 zfort. All rights reserved.
//

import UIKit

extension Dictionary {
    static func dictionaryStringAny(_ obj: AnyObject?) -> [String:Any]{
        if let dict = obj as? [String:Any] {
            return dict;
        }
        
        return [String:Any]();
    }
}

extension Dictionary where Key: ExpressibleByStringLiteral, Value: Any{
    var jsonString: String {
        do {
            let data = try JSONSerialization.data(withJSONObject:self, options:[.prettyPrinted])
            let dataString = String(data: data, encoding: String.Encoding.utf8)!
            return dataString;
        } catch {
            print("JSON serialization failed:  \(error)")
        }
        
        return "";
    }
    
    func dictionary(obj: Any?) -> [String:Any] {
        if let dict = obj as? [String:Any]
        {
            return dict;
        }
        
        return [String:Any]();
    }
    
    func valueFor(_ key: String) -> Any? {
        for (keyIn,value) in self {
            if let string = keyIn as? String, string == key {
                return value
            }
        }
        
        return nil
    }
    
    func intFor(key: String) -> Int? {
        if let val = valueFor(key) as? Int {
            return val
        }
        
        if let val = valueFor(key) as? String {
            if let intVal = Int(val) {
                return intVal
            }
        }
        
        return nil
    }
    
    func stringFor(key: String) -> String {
        if let val = valueFor(key) as? String {
            return val;
        }
        
        if let val = self.intFor(key: key) {
            return String(val);
        }
        
        if let val = self.doubleFor(key: key) {
            return String(val);
        }
        
        return ""
    }
    
    func boolForKey(key: String) -> Bool {
        if let val = self.valueFor(key) as? Bool {
            return val
        }
        
        let val = stringFor(key: key)
        
        return val == "1"
    }
    
    func doubleFor(key: String) -> Double? {
        if let val = self.valueFor(key) as? Double {
            return val
        } else {
            if let valueString = self.valueFor(key) as? String {
                return Double(valueString)
            }
        }        
        return nil;
    }
    
    func arrayFor(key: String) -> [Any]? {
        if let val = self.valueFor(key) as? [Any] {
            return val
        }
        
        return nil;
    }
    
    func arrayOfDictionariesFor(key: String) -> [[String:Any]]? {
        if let val = self.valueFor(key) as? [[String:Any]] {
            return val
        }
        
        return nil;
    }
    
    func dictionaryStringAnyFor(key: String) -> [String:Any]? {
        if let val = self.valueFor(key) as? [String:Any] {
            return val
        } else {
            return [String:Any]()
        }
    }

}
