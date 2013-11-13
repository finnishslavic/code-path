//
//  ToDoViewController.m
//  ToDoList
//
//  Created by Viacheslav Panasenko on 10/30/13.
//  Copyright (c) 2013 Viacheslav Panasenko. All rights reserved.
//

#import "ToDoViewController.h"
#import "ToDoCell.h"
#import "ToDoItem.h"

@interface ToDoViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ToDoViewController {
    NSMutableArray *_toDoItems;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _toDoItems = [[NSMutableArray alloc] init];
        [_toDoItems addObject:[ToDoItem toDoItemWithText:@"Feed the cat"]];
        [_toDoItems addObject:[ToDoItem toDoItemWithText:@"Buy eggs"]];
        [_toDoItems addObject:[ToDoItem toDoItemWithText:@"Pack bags for WWDC"]];
        [_toDoItems addObject:[ToDoItem toDoItemWithText:@"Rule the web"]];
        [_toDoItems addObject:[ToDoItem toDoItemWithText:@"Buy a new iPhone"]];
        [_toDoItems addObject:[ToDoItem toDoItemWithText:@"Find missing socks"]];
        [_toDoItems addObject:[ToDoItem toDoItemWithText:@"Write a new tutorial"]];
        [_toDoItems addObject:[ToDoItem toDoItemWithText:@"Master Objective-C"]];
        [_toDoItems addObject:[ToDoItem toDoItemWithText:@"Remember your wedding anniversary!"]];
        [_toDoItems addObject:[ToDoItem toDoItemWithText:@"Drink less beer"]];
        [_toDoItems addObject:[ToDoItem toDoItemWithText:@"Learn to draw"]];
        [_toDoItems addObject:[ToDoItem toDoItemWithText:@"Take the car to the garage"]];
        [_toDoItems addObject:[ToDoItem toDoItemWithText:@"Sell things on eBay"]];
        [_toDoItems addObject:[ToDoItem toDoItemWithText:@"Learn to juggle"]];
        [_toDoItems addObject:[ToDoItem toDoItemWithText:@"Give up"]];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UINib *customCell = [UINib nibWithNibName:@"ToDoCell" bundle:nil];
    [self.tableView registerNib:customCell forCellReuseIdentifier:@"ToDoCell"];
    
    [self.tableView registerClass:[ToDoCell class] forCellReuseIdentifier:@"ToDoCell"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor blackColor];
}

-(UIColor *)colorForIndex:(NSInteger) index
{
    NSUInteger itemCount = _toDoItems.count - 1;
    float val = ((float)index / (float)itemCount) * 0.6;
    return [UIColor colorWithRed:1.0 green:val blue:0.0 alpha:1.0];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0f;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [self colorForIndex:indexPath.row];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_toDoItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"ToDoCell";
    ToDoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    int index = [indexPath row];
    ToDoItem *item = _toDoItems[index];
    
    cell.delegate = self;
    cell.todoItem = item;
    
    return cell;
}

-(void)toDoItemDeleted:(ToDoItem *)todoItem
{
    NSUInteger index = [_toDoItems indexOfObject:todoItem];
    [self.tableView beginUpdates];
    [_toDoItems removeObjectAtIndex:index];
    [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]]
                          withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView endUpdates];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
