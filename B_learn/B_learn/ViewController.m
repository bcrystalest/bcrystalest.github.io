//
//  ViewController.m
//  B_learn
//
//  Created by 陈威利 on 2022/9/14.
//

#import "ViewController.h"
#import "B_learnView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    B_learnView *view = [[B_learnView alloc] init];
    view.frame = CGRectMake(100, 100, 300, 300);
    [self.view addSubview:view];
}


@end
