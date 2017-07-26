//
//  MineViewController.m
//  MJExtensionDemo
//
//  Created by BillBo on 2017/7/25.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
   
    [super viewDidLoad];

    [self changedLanguage];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changedLanguage) name:APPLANGUAGE_CHANGED object:nil];
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
}

- (void)changedLanguage {
  
    self.title = FGGetStringWithKeyFromTable(k_Mine, @"BB");
    
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:k_ExchangeLanguage style:UIBarButtonItemStylePlain target:self action:@selector(changeLg)];
    
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;

}



- (void)changeLg {
 
    NSArray *languageArray = @[@"中文", @"日文",@"英语"];
    
    [ShowMessageObject showMessageWithController:self Title:@"切换语言" message:@"" style:UIAlertControllerStyleActionSheet cancelStyle:UIAlertActionStyleCancel actionTitles:languageArray cancelTitle:@"取消" clickChooseAction:^(NSUInteger index) {
        
        switch (index) {
            case 0:
            {
                [[LanguageManager sharedInstance] setNewLanguage:CNS];

                
            }
                break;
            case 1:
            {
                [[LanguageManager sharedInstance] setNewLanguage:JAP];
            }
                break;
            case 2:
            {
                [[LanguageManager sharedInstance] setNewLanguage:EN];
            }
                break;
                
            default:
                break;
        }
        
    } cancelAction:^{
        
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
