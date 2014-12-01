//
//  MainWindow.h
//  GraffleToXCode
//
//  Created by Hernan on 11/27/14.
//  Copyright (c) 2014 Hernan. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "GraffleFileDragInView.h"

@interface MainWindow : NSWindow <GraffleFileDragInDelegate>

- (void)start;

@end
