//
//  DragOutImageView.h
//  GraffleToXCode
//
//  Created by Hernan on 7/20/14.
//  Copyright (c) 2014 Hernan. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "GraffleProject.h"

@interface GraffleFileDragOutView : NSImageView

// API
- (GraffleFileDragOutView *)initWithImage:(NSImage *)theImage;

- (void)enableForPrject:(GraffleProject *)theProject;
- (void)disable;

@end
