//
//  doDownload.swift
//  TrinityEvents
//
//  Created by Bryan on 18/03/2016.
//  Copyright © 2016 Apple Inc. All rights reserved.
//
// function for downloading to a URL and writing to a file in the app's folder
import Foundation

func doDownload(url: String,filename: String) {
    let path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
    let documentDirectoryPath:String = path[0]
    let eventsFilePath = NSURL(fileURLWithPath: documentDirectoryPath.stringByAppendingString(filename))
    let url = NSURL(string: url)!
    let urlData = NSData(contentsOfURL:url);
    if (( urlData ) != nil)
    {
        print("loaded from " + filename + " URL")
        if (urlData!.writeToURL(eventsFilePath, atomically: true) == true)
        {
            print("writing Succeded")
        }
    }
}