//
//  FullScreenPlugin.m
//  CodaFullScreen
//
//  Created by Chris Alvares on 1/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FullScreenPlugin.h"
#import "CodaPlugInsController.h"

@implementation FullScreenPlugin

- (id)initWithPlugInController:(CodaPlugInsController*)inController bundle:(NSBundle*)aBundle
{
	if ( (self = [super init]) != nil )
	{
        
        [[NSApplication sharedApplication]  setPresentationOptions:NSFullScreenWindowMask];
		controller = inController;
        [controller registerActionWithTitle:@"Created by Chris Alvares" target:self selector:@selector(nothing)];

		[controller registerActionWithTitle:NSLocalizedString(@"Add FullScreen Support", @"Add FullScreen Support") target:self selector:@selector(goFullScreen:)];
        
        [controller registerActionWithTitle:NSLocalizedString(@"Plugin not working?", @"Plugin not working?") target:self selector:@selector(showHelpOptions:)];

	}
	return self;
}


- (NSString*)name
{
	return @"FullScreenMode";
}

-(void) showHelpOptions:(id) sender
{
    [self makeAlertWithMessage:@"The Fullscreen plugin requires you to open project, then click the 'Add Fullscreen Support' Button.\n To exit fullscreen mode, move your mouse to the very top of your screen to show the menu bar and then click the fullscreen button there.\n If you still have problems, send me an email at mail@chrisalvares.com" andTitle:@"Help"];
    
}

- (void)goFullScreen:(id)sender
{
	CodaTextView* tv = [controller focusedTextView:self];
	if ( tv )
	{
        [[tv window] setCollectionBehavior:
         NSWindowCollectionBehaviorFullScreenPrimary];
	}
}

-(void) makeAlertWithMessage:(NSString *) message andTitle:(NSString *) title
{
	NSAlert *alert = [NSAlert alertWithMessageText:title
									 defaultButton:@"OK"
								   alternateButton:nil
									   otherButton:nil
						 informativeTextWithFormat:message];
	[alert runModal];
	
}



- (void)exitFullScreen:(id)sender
{
	CodaTextView* tv = [controller focusedTextView:self];
	if ( tv )
	{
        [[tv window] toggleFullScreen:tv];
	}
}

@end
