/*------------------------------------------------------------------------
* (The MIT License)
* 
* Copyright (c) 2008-2011 Rhomobile, Inc.
* 
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
* 
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
* 
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
* 
* http://rhomobile.com
*------------------------------------------------------------------------*/

#import <UIKit/UIKit.h>
#import "WaitLoginController.h"
#import "RootViewController.h"

@class RhoConnectNotify;
@interface LoginViewController : UIViewController {
	IBOutlet UITextField* txtLogin;
	IBOutlet UITextField* txtPassword;
	IBOutlet WaitLoginController *waitPage;
	IBOutlet RootViewController *indexPage;
	
}

@property (retain, nonatomic) IBOutlet UITextField* txtLogin;
@property (retain, nonatomic) IBOutlet UITextField* txtPassword;
@property (nonatomic, retain) IBOutlet WaitLoginController* waitPage;
@property (nonatomic, retain) IBOutlet RootViewController* indexPage;

- (IBAction)doLogin:(id)sender;
- (void)loginComplete:(RhoConnectNotify*) notify;

@end
