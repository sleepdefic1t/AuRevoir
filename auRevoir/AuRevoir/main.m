//
//  main.m
//  auRevoir
//
//  Created by Patrick Wardle on 5/10/18.
//  Copyright © 2018 Objective-See. All rights reserved.
//

#import <Cocoa/Cocoa.h>

int main(int argc, const char * argv[])
{
    //status
    int status = -1;
    
    //os version
    NSOperatingSystemVersion osVersion = {0,0,0};
    
    //alert
    NSAlert* alert = nil;
    
    //get os version
    osVersion = [[NSProcessInfo processInfo] operatingSystemVersion];
    
    // supports 10.13 (High Sierra) <=> 11.2 (Big Sur)
    if ((osVersion.majorVersion < 10 && osVersion.minorVersion < 13) ||
        (osVersion.majorVersion > 11 && osVersion.minorVersion > 2))
    {
        //init alert
        alert = [[NSAlert alloc] init];
        
        //set main text
        alert.messageText = @"Unsupported OS";
        
        //set informative text
        alert.informativeText = [NSString stringWithFormat:@"macOS %@\nis not supported.", [[NSProcessInfo processInfo] operatingSystemVersionString]];
        
        //button: 'ok'
        [alert addButtonWithTitle:@"OK"];
        
        //show
        [alert runModal];
    
        //bail
        goto bail;
    }
    
    //app main
    status = NSApplicationMain(argc, argv);
    
bail:
    
    return status;
}
