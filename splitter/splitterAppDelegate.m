#import "splitterAppDelegate.h"

@implementation splitterAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    window = [[SPWindow alloc] initWithContentRect:[[NSScreen mainScreen] frame] styleMask:NSBorderlessWindowMask backing:NSBackingStoreBuffered defer:YES];
    [window setLevel:NSScreenSaverWindowLevel];
    [window setOpaque:NO];
    [window setBackgroundColor:[NSColor clearColor]];
    [window setIgnoresMouseEvents:NO];
    
    splitterView = [[SPView alloc] initWithFrame:[[NSScreen mainScreen] frame]];
    
    SPTree * root = [[SPTree alloc] init];
    
    SPTree * one = [[SPTree alloc] init];
    SPTree * two = [[SPTree alloc] init];
    SPTree * three = [[SPTree alloc] init];
    SPTree * four = [[SPTree alloc] init];
    
    SPTree * threeOne = [[SPTree alloc] init];
    SPTree * threeTwo = [[SPTree alloc] init];
    
    root.children = [[NSArray alloc] initWithObjects:one,two,three,four,nil];
    root.direction = SPHorizontalDirection;
    
    three.children = [[NSArray alloc] initWithObjects:threeOne,threeTwo,nil];
    three.direction = SPVerticalDirection;
    
    threeOne.fraction = 0.5f;
    threeTwo.fraction = 0.5f;
    
    one.fraction = 0.25f;
    two.fraction = 0.25f;
    three.fraction = 0.25f;
    four.fraction = 0.25f;
    
    splitterView.root = root;
    
    [window setContentView:splitterView];
    
    [window makeKeyAndOrderFront:nil];

}

@end
