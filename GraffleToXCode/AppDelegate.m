//
//  AppDelegate.m
//  GraffleToXCode
//
//  Created by Hernan on 7/19/14.
//  Copyright (c) 2014 Hernan. All rights reserved.
//

#import "AppDelegate.h"
#import "MainWindow.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
  [(MainWindow *)self.window start];
}

@end
