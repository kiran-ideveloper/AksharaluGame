//
//  ViewController.m
//  Telugu
//
//  Created by Ipap Academy on 22/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "Store.h"

@implementation ViewController
@synthesize imageView1;
@synthesize imageView2;
NSMutableArray *capital, *small, *finalMutable;
NSMutableSet *randomset;
NSArray *final;


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
  //  NSLog(@"file name:%s, method:%s", __FILE__, __FUNCTION__);
    [super viewDidLoad];
    sranddev();
    
    capital =  [[NSMutableArray alloc]initWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z", nil];
    small = [[NSMutableArray alloc]initWithObjects:@"0",@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z", nil];
    
  //  NSLog(@"capital:%@",capital);
    
    randomset = [NSMutableSet set];
    while ([randomset count] < 9) {
        [randomset addObject:[capital objectAtIndex:rand()%[capital count]]];
    }
   
    while ([randomset count] < 18) {
        [randomset addObject:[small objectAtIndex:rand()%[small count]]];
    }
    
    
    final = [randomset allObjects];
    finalMutable = [NSMutableArray arrayWithArray:final];
   
    
    for (Store *labels in self.view.subviews) 
    {
        if([labels isMemberOfClass:[Store class]])
        {
            int index = rand() % [finalMutable count];
            labels.text = [finalMutable objectAtIndex:index];
            [finalMutable removeObjectAtIndex:index];
            UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan:)];
            [labels addGestureRecognizer:pan];
            [self.view bringSubviewToFront:labels];
            [pan release];
        }
    }
    
       
	// Do any additional setup after loading the view, typically from a nib.
}


-(void) handlePan:(UIPanGestureRecognizer *) sender
{
    if(sender.state == UIGestureRecognizerStateBegan)
    {
        ((Store*)sender.view).initialPoint = sender.view.center;
//        s.initialPoint =  sender.view.center;
//        NSLog(@"%f",s.initialPoint.x);
//        Store *startingPoint = [[Store alloc]init];
//        startingPoint.initialPoint = sender.view.center;
//        NSLog(@"%f,%f",startingPoint.initialPoint.x,startingPoint.initialPoint.y);
       
    }
    CGPoint translation = [sender translationInView:sender.view];
    sender.view.center = CGPointMake(sender.view.center.x + translation.x , sender.view.center.y + translation.y);
    [sender setTranslation:CGPointMake(0,0) inView:sender.view];
     
    if(sender.state == UIGestureRecognizerStateEnded)
    {
        UILabel *labelText = (UILabel *)sender.view;
      

        //imageView1
        static int x1,y1,count1 = 1, x2,y2,count2 = 1;

        if(CGRectIntersectsRect(self.imageView1.frame, sender.view.frame) && (count1 < 10) && [capital containsObject:labelText.text] )
        {
            
            
            [self.imageView1 addSubview:sender.view];
                       
            sender.view.frame = CGRectMake(x1, y1, 44, 44);
            [self.imageView1 bringSubviewToFront:sender.view];
            if(count1 % 3 == 0)
            {
                y1 += 50;
                x1 = 0;
            }
            else
            {
                x1 += 44; 
            }
            NSLog(@"%d",(count1 % 4));
            count1 ++;
            NSLog(@"%f,%f",sender.view.center.x,sender.view.center.y);
        }
        else if(CGRectIntersectsRect(self.imageView2.frame, sender.view.frame) && (count2 < 10) && [small containsObject:labelText.text])
        {
            [self.imageView2 addSubview:sender.view];
            //           [sender.view removeFromSuperview];
            
            sender.view.frame = CGRectMake(x2, y2, 44, 44);
            [self.imageView2 bringSubviewToFront:sender.view];
            if(count2 % 3 == 0)
            {
                y2 += 50;
                x2 = 0;
            }
            else
            {
                x2 += 44; 
            }
            NSLog(@"%d",(count2 % 4));
            count2 ++;
            NSLog(@"%f,%f",sender.view.center.x,sender.view.center.y);
        }
        else
        {
            
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:1];
            sender.view.center = ((Store*)sender.view).initialPoint;        
            [UIView commitAnimations];
        }

    }
    
}

- (void)viewDidUnload
{
    [self setImageView1:nil];
    [self setImageView2:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    
    [imageView1 release];
    [imageView2 release];
    [super dealloc];
}
@end
