//
//  ToDoCell.h
//  ToDoList
//
//  Created by Viacheslav Panasenko on 10/31/13.
//  Copyright (c) 2013 Viacheslav Panasenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoItem.h"
#import "ToDoCellDelegate.h"

@interface ToDoCell : UITableViewCell

@property (nonatomic) ToDoItem *todoItem;
@property (nonatomic, assign) id<ToDoCellDelegate> delegate;

@end
