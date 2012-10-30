//
//  ViewController.h
//  Telugu
//
//  Created by Ipap Academy on 22/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AppDelegate;
@interface ViewController : UIViewController <UIAlertViewDelegate>
@property (retain, nonatomic) IBOutlet UIImageView *imageView1;
@property (retain, nonatomic) IBOutlet UIImageView *imageView2;


@property (retain,nonatomic)    AppDelegate *delegateShow ;
@end
