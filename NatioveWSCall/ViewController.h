//
//  ViewController.h
//  NatioveWSCall
//
//  Created by Tops on 12/05/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebServieceCall.h"

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *txtGet;
@property (strong, nonatomic) IBOutlet UITextField *txtPost;
@property (strong, nonatomic) IBOutlet UITextField *txtKey;
@property (strong, nonatomic) IBOutlet UITextField *txtValue;
@property (strong, nonatomic) IBOutlet UITextView *textView;
- (IBAction)btnGetClick:(id)sender;
- (IBAction)btnPostClick:(id)sender;
- (IBAction)btnImage:(id)sender;
@end