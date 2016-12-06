//
//  CocoaPods_packagetest.m
//  CocoaPods_packagetest
//
//  Created by sumittr on 05/12/16.
//  Copyright © 2016 sumittr. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CocoaPods_packagetest.h"

@implementation sampleClass

+(void)print
{
    NSLog(@"Inside the Hcokey App implementation class");
    
    [[BITHockeyManager sharedHockeyManager] configureWithIdentifier:@"APP_IDENTIFIER"];
    [[BITHockeyManager sharedHockeyManager] startManager];
    
    NSLog(@"No errors in implementing Hockey App SDK");
}

+(NSString *)ReadConfigurationJson
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSBundle *resourceBundle = [NSBundle mainBundle];
    
    //[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Custom.bundle/Images/exemple.png"]
    
    NSString *jsonFilePath = [resourceBundle pathForResource:@"sampleText" ofType:@"json"];
    
    if([fileManager fileExistsAtPath:jsonFilePath])
    {
        @try
        {
            NSError *error;
            NSString *jsonContents = [NSString stringWithContentsOfFile:jsonFilePath encoding:NSUTF8StringEncoding error:&error];
            NSLog(@"JSONContents: %@",jsonContents);
            return jsonContents;
            
        }
        @catch (NSException *exception)
        {
            return @"";
        }
    }
    else
    {
        NSLog(@"Configuration file not found 2");
    }
    return @"";
}


@end