#import "SPView.h"

@implementation SPView

@synthesize root;

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    
    if(self)
    {
        [NSTimer scheduledTimerWithTimeInterval:0.01666f target:self selector:@selector(update:) userInfo:nil repeats:YES];
    }
    
    return self;
}

- (void)update:(NSTimer *)timer
{
    [self setNeedsDisplay:YES];
}

- (double)drawTreeElement:(SPTree *)el withParentRect:(NSRect)parentRect direction:(SPDirection)direction consumed:(double)consumed
{
    NSRect newRect = NSZeroRect;
    
    switch (direction)
    {
        case SPHorizontalDirection:
            newRect.size.width = parentRect.size.width * el.fraction;
            newRect.size.height = parentRect.size.height;
            newRect.origin.x = parentRect.origin.x + consumed;
            newRect.origin.y = parentRect.origin.y;
            
            consumed += newRect.size.width;
            break;
        case SPVerticalDirection:
            newRect.size.width = parentRect.size.width;
            newRect.size.height = parentRect.size.height * el.fraction;
            newRect.origin.x = parentRect.origin.x;
            newRect.origin.y = parentRect.origin.y + consumed;
            
            consumed += newRect.size.height;
            break;
        default:
            break;
    }
    
    if(el.children == nil)
    {
        //[[NSColor colorWithDeviceRed:((float)rand()/(float)RAND_MAX) green:((float)rand()/(float)RAND_MAX) blue:((float)rand()/(float)RAND_MAX) alpha:0.3] setFill];
        [[NSColor redColor] setStroke];
        [[NSBezierPath bezierPathWithRect:newRect] stroke];
    }
    
    double innerConsumed = 0.0;
    
    for (SPTree * subel in el.children)
    {
        innerConsumed = [self drawTreeElement:subel withParentRect:newRect direction:el.direction consumed:innerConsumed];
    }
    
    return consumed;
}

- (void)drawRect:(NSRect)rect
{
    [self drawTreeElement:root withParentRect:[self frame] direction:root.direction consumed:0.0f];
    
    [[NSColor blackColor] setFill];
    
    NSPoint mouseLoc = [NSEvent mouseLocation];
    NSRectFill(NSMakeRect(mouseLoc.x-3, mouseLoc.y+10, 6, 6));
}


@end
