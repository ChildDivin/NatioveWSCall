//
//  ViewController2.h
//  NatioveWSCall
//
//  Created by Tops on 13/05/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController2 : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *txtURL;
@property (strong, nonatomic) IBOutlet UIImageView *img;
@property (strong, nonatomic) IBOutlet UITextView *textView2;
- (IBAction)btnCallClick:(id)sender;
- (IBAction)btnBackclick:(id)sender;
@end
