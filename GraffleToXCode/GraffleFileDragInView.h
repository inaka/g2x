//
//  DragInImageView.h
//  GraffleToXCode
//
//  Created by Hernan on 7/20/14.
//  Copyright (c) 2014 Hernan. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "GraffleConverter.h"

@protocol GraffleFileDragInDelegate <NSObject>

- (void)gotGraffleFileAtPath:(NSString *)path;

@end

@interface GraffleFileDragInView : NSImageView <NSDraggingDestination>

- (GraffleFileDragInView *)initWithImage:(NSImage *)theImage
                             andDelegate:(id<GraffleFileDragInDelegate>)theDelegate;

@end
