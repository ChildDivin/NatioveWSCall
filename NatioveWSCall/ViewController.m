//
//  ViewController.m
//  NatioveWSCall
//
//  Created by Tops on 12/05/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.txtGet.text=@"http://mijn.roeland.be/api/v1/projects/?email=onno@code-on.be&password=test";
    self.txtPost.text=@"http://192.168.0.18/prilov/trunk/ws/user/get_products_recent_seen?user_id=14289&flag=2&lang=english";
    self.txtKey.text=@"facebook_id";
    self.txtValue.text=@"123456";
    self.textView.text=[NSString stringWithFormat:@"see here your ws responce data ..."];
}
#pragma mark -Button Actions
- (IBAction)btnGetClick:(id)sender {
    [[WebServieceCall sharedSingleton] GETCall:[self.txtGet.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] success:^(id respocneDATA) {
        NSLog(@"responce %@",respocneDATA);
        self.textView.text=[NSString stringWithFormat:@"%@",respocneDATA];
    } failure:^(id FailDATA) {
        NSLog(@"responce %@",FailDATA);
    }];
}
- (IBAction)btnPostClick:(id)sender {
    
    NSMutableDictionary *postDict = [[NSMutableDictionary alloc] init];
    [postDict setValue:self.txtValue.text forKey:self.txtKey.text];
    
    [[WebServieceCall sharedSingleton] POSTCall:[self.txtPost.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] :postDict sucess:^(id respocneDATA) {
        NSLog(@"RESPONCE %@",respocneDATA);
        self.textView.text=[NSString stringWithFormat:@"%@",respocneDATA];
    } filure:^(id FailDATA)
     {
         NSLog(@"FailDATA %@",FailDATA);
     }];
}

- (IBAction)btnImage:(id)sender {
    NSMutableDictionary *postDict = [[NSMutableDictionary alloc] init];
    [postDict setValue:@"onno@code-on.be" forKey:@"email"];
    [postDict setValue:@"test" forKey:@"password"];
    [postDict setValue:@"114" forKey:@"project-id"];
    NSData *data = UIImageJPEGRepresentation([UIImage imageNamed:@"image.jpg"], 0.5);
    [[WebServieceCall sharedSingleton]UPLOADImageCall:@"http://mijn.roeland.be/api/v1/pictures/upload" :postDict :data success:^(id respocneDATA){
        NSLog(@"RESPONCE %@",respocneDATA);
    } Failure:^(id FailDATA) {
        NSLog(@"FailDATA %@",FailDATA);
    }];
}
@end
