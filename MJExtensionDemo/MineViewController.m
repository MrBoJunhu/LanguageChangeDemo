//
//  MineViewController.m
//  MJExtensionDemo
//
//  Created by BillBo on 2017/7/25.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()

@property (nonatomic, strong) UIBarButtonItem *rightBarButtonItem;

@end

@implementation MineViewController

- (void)viewDidLoad {
   
    [super viewDidLoad];
    
    NSString *rightItemTitle = FGGetStringWithKeyFromTable(k_ExchangeLanguage, k_BB_Table1);
    
    self.rightBarButtonItem  = [[UIBarButtonItem alloc] initWithTitle:rightItemTitle style:UIBarButtonItemStylePlain target:self action:@selector(changeLg)];
    
    self.navigationItem.rightBarButtonItem = self.rightBarButtonItem;
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
}

- (void)changeLg {
 
    NSString *chinese = FGGetStringWithKeyFromTable(k_Chinese, k_BB_Table1);
    
    NSString *english = FGGetStringWithKeyFromTable(k_English, k_BB_Table1);
    
    NSString *japanese = FGGetStringWithKeyFromTable(k_Japanese, k_BB_Table1);
    
    NSString *cancelString = FGGetStringWithKeyFromTable(k_Cancel, k_BB_Table1);
    
    NSString *titleString = FGGetStringWithKeyFromTable(k_ExchangeLanguage, k_BB_Table1);
    
    NSArray *languageArray = @[chinese, japanese,english];
    
    [ShowMessageObject showMessageWithController:self Title:titleString message:@"" style:UIAlertControllerStyleActionSheet cancelStyle:UIAlertActionStyleCancel actionTitles:languageArray cancelTitle:cancelString clickChooseAction:^(NSUInteger index) {
        
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
