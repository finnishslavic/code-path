//
//  ToDoViewController.h
//  ToDoList
//
//  Created by Viacheslav Panasenko on 10/30/13.
//  Copyright (c) 2013 Viacheslav Panasenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoCellDelegate.h"

@interface ToDoViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, ToDoCellDelegate>

@end
