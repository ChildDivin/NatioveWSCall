//
//  ViewController2.m
//  NatioveWSCall
//
//  Created by Tops on 13/05/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

#import "ViewController2.h"
#import "WebServieceCall.h"

@interface ViewController2 ()
@end
@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.txtURL.text=@"http://192.168.0.143/parles/trunk/ws/user/add_profile_images";
    self.textView2.text=[NSString stringWithFormat:@"see here your ws responce data ..."];
}
- (IBAction)btnCallClick:(id)sender
{
    NSMutableDictionary *postDict = [[NSMutableDictionary alloc] init];
    [postDict setValue:@"" forKey:@"image_id"];
    [postDict setValue:@"4" forKey:@"user_id"];
    [postDict setValue:@"0" forKey:@"is_profile"];
    NSData *data = UIImageJPEGRepresentation(self.img.image, 0.5);
    [[WebServieceCall sharedSingleton]UPLOADImageCall:@"http://192.168.0.143/parles/trunk/ws/user/add_profile_images" :postDict :data success:^(id respocneDATA){
        NSLog(@"RESPONCE %@",respocneDATA);
        self.textView2.text=[NSString stringWithFormat:@"see here your ws responce data ..."];
    } Failure:^(id FailDATA) {
        NSLog(@"FailDATA %@",FailDATA);
    }];
}
- (IBAction)btnBackclick:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
