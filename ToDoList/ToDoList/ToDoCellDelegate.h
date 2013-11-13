//
//  ToDoCellDelegate.h
//  ToDoList
//
//  Created by Viacheslav Panasenko on 10/31/13.
//  Copyright (c) 2013 Viacheslav Panasenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ToDoItem.h"

@protocol ToDoCellDelegate <NSObject>

-(void)toDoItemDeleted:(ToDoItem *) todoItem;

@end
