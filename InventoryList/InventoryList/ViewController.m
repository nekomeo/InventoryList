//
//  ViewController.m
//  InventoryList
//
//  Created by Elle Ti on 2020-03-27.
//  Copyright © 2020 Elle Ti. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) UITableView *tableView;
@property (nonatomic) NSArray *items;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.items = @[@"TP", @"Kleenex"];
    [self configureTableView];
}

-(void)configureTableView {
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _tableView.backgroundColor = [UIColor cyanColor];
    
    // add to canvas
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellIdentifier";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text =  [_items objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"title of cell %@", [_items objectAtIndex:indexPath.row]);
}


@end
