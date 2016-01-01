//
//  CSVParser.swift
//  MyCSVParser
//
//  Created by supapon pucknavin on 1/1/2559 BE.
//  Copyright © 2559 supapon pucknavin. All rights reserved.
//

import UIKit

class CSVParser: NSObject {

    
    static let shatedInstance = CSVParser()
    
    
    override init() {
        super.init()
    }
    
    
    
    func loadConversationListWithFileName(FileName filename:String, ofType type:String)->[csvRow]{
        var newArData = [csvRow]()
        do{
            let filePath = NSBundle.mainBundle().pathForResource(filename, ofType: type)
            let file = try String(contentsOfFile: filePath!, encoding: NSUTF8StringEncoding)
            //print(file)
            
            let arTest = file.componentsSeparatedByString("\n")
            
            
            for str in arTest{
                let newObject = csvRow()
                let each = self.parserColumnCSVWith(StringColumn: str)
                
                
                
                
                newObject.arString = each
                newArData.append(newObject)
            }
            
            return newArData
        }catch{
            
            print(error)
            return newArData
        }
        
        
        
    }
    
    
    
    func parserColumnCSVWith(StringColumn str:String)->[String]{
        let each = str.componentsSeparatedByString(",")
        
        var result = [String]()
        
        var buffString:String = ""
        
        var needTail:Bool = false
        for s in each{
            print(s)
            if(needTail == false){
                buffString = s
                
                if s.characters.first == "\"" {
                    needTail = true
                    
                    buffString = s.substringWithRange(Range<String.Index>(start: s.startIndex.advancedBy(1), end: s.endIndex.advancedBy(0)))
                }
                
                
            }else{
                
                if s.characters.last == "\""{
                    needTail = false
                    let tail = s.substringWithRange(Range<String.Index>(start: s.startIndex.advancedBy(0), end: s.endIndex.advancedBy(-1)))
                    
                    buffString = buffString + tail
                }else{
                    buffString = buffString + s
                }
            }
            
            
            
            if(needTail == false){
                result.append(buffString)
            }
            
        }
        
        return result
        
    }
    
    
}

class csvRow {
    var arString:[String] = [String]()
}