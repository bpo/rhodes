//
//  LoginViewController.m
//  store
//
//  Created by Vlad on 8/30/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "RhoConnectEngine.h"
#import "LoginViewController.h"


@implementation LoginViewController

@synthesize txtLogin, txtPassword, waitPage, indexPage;

- (void)viewDidLoad 
{
	if ( [RhoConnectEngine sharedInstance].loginState == logged_in )
		[[self navigationController] pushViewController:indexPage animated:YES];
	else
		[super viewDidLoad];

}

- (void)loginComplete:(RhoConnectNotify*) notify
{
	if ( notify.error_code != RHO_ERR_NONE || ![[RhoConnectEngine sharedInstance].syncClient is_logged_in]) 
		[RhoConnectEngine sharedInstance].loginState = failed;	
	else
		[RhoConnectEngine sharedInstance].loginState = logged_in;	
	 
	[waitPage loginComplete: [notify error_message] ];	
	
	//[notify release];
}

- (IBAction)doLogin:(id)sender 
{
	[RhoConnectEngine sharedInstance].loginState = in_progress;	
	[[self navigationController] pushViewController:waitPage animated:YES];
	
	[ [RhoConnectEngine sharedInstance].syncClient loginWithUser:txtLogin.text pwd:txtPassword.text callback:@selector(loginComplete:) target:self];	
}

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
