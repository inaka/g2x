//
//  MainWindow.m
//  GraffleToXCode
//
//  Created by Hernan on 11/27/14.
//  Copyright (c) 2014 Hernan. All rights reserved.
//

#import "MainWindow.h"
#import "GraffleConverter.h"
#import "GraffleFileDragOutView.h"

@interface MainWindow()

@property (nonatomic, strong) GraffleProject *project;
@property (nonatomic, strong) GraffleConverter *converter;
@property (nonatomic, strong) GraffleFileDragInView *dragIn;
@property (nonatomic, strong) GraffleFileDragOutView *dragOut;

@end

@implementation MainWindow

- (void)start
{
  _converter = [[GraffleConverter alloc] init];

  NSImage *graffleLogo = [NSImage imageNamed:@"logo_g.png"];
  NSImage *xcodeLogo = [NSImage imageNamed:@"logo_x.png"];

  _dragIn = [[GraffleFileDragInView alloc] initWithImage:graffleLogo
                                             andDelegate:self];
  _dragIn.frame = CGRectMake(25.0f, 25.0f, 256.0f, 256.0f);
  [self.contentView addSubview:_dragIn];

  _dragOut = [[GraffleFileDragOutView alloc] initWithImage:xcodeLogo];
  _dragOut.frame = CGRectMake(419.0f, 25.0f, 256.0f, 256.0f);
  [self.contentView addSubview:_dragOut];
  [_dragOut disable];
}

- (void)gotGraffleFileAtPath:(NSString *)path
{
  _project = [_converter buildFromFileAt:path];
  [_dragOut enableForPrject:_project];
}

@end
