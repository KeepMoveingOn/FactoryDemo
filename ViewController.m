//
//  ViewController.m
//  FactoryDemo
//
//  Created by wcq on 2017/12/25.
//  Copyright © 2017年 wcq. All rights reserved.
//

#import "ViewController.h"
#import "WCQAStyleTableViewCell.h"
#import "WCQBStyleTableViewCell.h"
#import "WCQCStyleTableViewCell.h"
#import "WCQBaseTableViewCell.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *cellIdentifiers;
@property (nonatomic, strong) NSArray *cellClasses;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    for (NSInteger index = 0; index < self.cellIdentifiers.count; index++) {
        
        [tableView registerClass:self.cellClasses[index]
          forCellReuseIdentifier:self.cellIdentifiers[index]];
    }
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.cellIdentifiers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    /*
     
    if (indexPath.row == 0) {
        
        WCQAStyleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WCQAStyleTableViewCell"]];
        [cell configUI:nil];  //不同样式的Cell所展示的UI各不相同，由于是Demo样例，这里并未配置相关数据源
        return cell;
    }else if (indexPath.row == 1) {
        
        WCQBStyleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WCQBStyleTableViewCell"]];
        [cell configUI:nil];
        return cell;
    }else if (indexPath.row == 2) {
        
        WCQCStyleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WCQCStyleTableViewCell"]];
        [cell configUI:nil];
        return cell;
    }
     
    */
    
    WCQBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifiers[indexPath.row]];
    [cell configUI:nil];
    return cell;
}

#pragma mark - UITableViewDelegate

#pragma mark - Getter
- (NSArray *)cellIdentifiers {
    
    if (!_cellIdentifiers) {
        
        _cellIdentifiers = @[@"WCQAStyleTableViewCell",
                             @"WCQBStyleTableViewCell",
                             @"WCQCStyleTableViewCell"];
    }
    return _cellIdentifiers;
}

- (NSArray *)cellClasses {
    
    if (!_cellClasses) {
        
        _cellClasses = @[[WCQAStyleTableViewCell class],
                         [WCQBStyleTableViewCell class],
                         [WCQCStyleTableViewCell class]];;
    }
    return _cellClasses;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
