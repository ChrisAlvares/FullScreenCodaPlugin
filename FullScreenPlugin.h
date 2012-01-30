//
//  FullScreenPlugin.h
//  CodaFullScreen
//
//  Created by Chris Alvares on 1/29/12.
//  Copyright (c) 2012 Chris Alvares. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CodaPluginsController.h"

@class CodaPlugInsController;

@interface FullScreenPlugin : NSObject <CodaPlugIn>
{
	CodaPlugInsController* controller;
}

- (id)initWithPlugInController:(CodaPlugInsController*)controller bundle:(NSBundle*)aBundle;
- (void)goFullScreen:(id)sender;
-(void) makeAlertWithMessage:(NSString *) message andTitle:(NSString *) title;

@end
