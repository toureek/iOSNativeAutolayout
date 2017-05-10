
#import "AnchorView.h"


@interface AnchorView()

@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, strong) UIImageView *avatorImageView;
@property (nonatomic, strong) UILabel *userNameLabel;

@end

@implementation AnchorView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpComponentsOnView];
    }
    return self;
}

- (void)setUpComponentsOnView {
    [self initAndSetupBackgroundImageView];
    [self initAndSetupAvatorImageView];
    [self initAndSetupUserNameLabel];
    
    self.layer.borderWidth = 1;
    self.layer.borderColor = [UIColor redColor].CGColor;
    [self setNeedsUpdateConstraints];
}

- (void)initAndSetupBackgroundImageView {
    _backgroundImageView = [[UIImageView alloc] init];
    _backgroundImageView.backgroundColor = [UIColor greenColor];
    [self addSubview:_backgroundImageView];
}

- (void)initAndSetupAvatorImageView {
    _avatorImageView = [[UIImageView alloc] init];
    _avatorImageView.backgroundColor = [UIColor blueColor];
    _avatorImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    _avatorImageView.layer.borderWidth = 2;
    [self addSubview:_avatorImageView];
}

- (void)initAndSetupUserNameLabel {
    _userNameLabel = [[UILabel alloc] init];
    _userNameLabel.textAlignment = NSTextAlignmentRight;
    _userNameLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    _userNameLabel.numberOfLines = 1;
    _userNameLabel.backgroundColor = [UIColor clearColor];
    _userNameLabel.textColor = [UIColor redColor];
    _userNameLabel.text = @"UserName UserName UserName";
    _userNameLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:_userNameLabel];
}


- (void)updateConstraints {
    [super updateConstraints];
    
    [self addBackgroundImageViewConstains];
    [self addAvatorImageViewConstains];
    [self addUserNameLabelConstains];
}

- (void)addBackgroundImageViewConstains {
    _backgroundImageView.translatesAutoresizingMaskIntoConstraints = NO;
    if (IOS9_OR_GREATER) {
        [_backgroundImageView.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
        [_backgroundImageView.leftAnchor constraintEqualToAnchor:self.leftAnchor].active = YES;;
        [_backgroundImageView.rightAnchor constraintEqualToAnchor:self.rightAnchor].active = YES;;
        [_backgroundImageView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-kImageBottomPadding].active = YES;
    }
    else {
        NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:_backgroundImageView
                                                                         attribute:NSLayoutAttributeTop
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self
                                                                         attribute:NSLayoutAttributeTop
                                                                        multiplier:1
                                                                          constant:0];
        
        NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:_backgroundImageView
                                                                          attribute:NSLayoutAttributeLeft
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self
                                                                          attribute:NSLayoutAttributeLeft
                                                                         multiplier:1
                                                                           constant:0];
        
        NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:_backgroundImageView
                                                                           attribute:NSLayoutAttributeRight
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self
                                                                           attribute:NSLayoutAttributeRight
                                                                          multiplier:1
                                                                            constant:0];
        
        NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:_backgroundImageView
                                                                            attribute:NSLayoutAttributeBottom
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:self
                                                                            attribute:NSLayoutAttributeBottom
                                                                           multiplier:1
                                                                             constant:-kImageBottomPadding];
        
        [self addConstraints:@[topConstraint, leftConstraint, rightConstraint, bottomConstraint]];
    }
}

- (void)addAvatorImageViewConstains {
    _avatorImageView.translatesAutoresizingMaskIntoConstraints = NO;
    if (IOS9_OR_GREATER) {
        [_avatorImageView.widthAnchor constraintEqualToConstant:kAvatorSize].active = YES;
        [_avatorImageView.heightAnchor constraintEqualToConstant:kAvatorSize].active = YES;
        [_avatorImageView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-kLeftRightPadding/2].active = YES;
        [_avatorImageView.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-kLeftRightPadding].active = YES;
    }
    else {
        NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:_avatorImageView
                                                                           attribute:NSLayoutAttributeWidth
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:nil
                                                                           attribute:NSLayoutAttributeNotAnAttribute
                                                                          multiplier:1
                                                                            constant:kAvatorSize];
        
        NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:_avatorImageView
                                                                            attribute:NSLayoutAttributeHeight
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:nil
                                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                                           multiplier:1
                                                                             constant:kAvatorSize];
        
        NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:_avatorImageView
                                                                            attribute:NSLayoutAttributeBottom
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:self
                                                                            attribute:NSLayoutAttributeBottom
                                                                           multiplier:1
                                                                             constant:-(kLeftRightPadding/2.0)];
        
        NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:_avatorImageView
                                                                           attribute:NSLayoutAttributeRight
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self
                                                                           attribute:NSLayoutAttributeRight
                                                                          multiplier:1
                                                                            constant:-kLeftRightPadding];
        
        [self addConstraints:@[widthConstraint, heightConstraint, bottomConstraint, rightConstraint]];
    }
}

- (void)addUserNameLabelConstains {
    _userNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    if (IOS9_OR_GREATER) {
        [_userNameLabel.centerYAnchor constraintEqualToAnchor:_avatorImageView.centerYAnchor].active = YES;
        [_userNameLabel.heightAnchor constraintEqualToConstant:17].active = YES;
        [_userNameLabel.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:kLeftRightPadding].active = YES;
        [_userNameLabel.rightAnchor constraintEqualToAnchor:_avatorImageView.leftAnchor constant:-kLeftRightPadding].active = YES;
    }
    else {
        NSLayoutConstraint *centerYConstraint = [NSLayoutConstraint constraintWithItem:_userNameLabel
                                                                             attribute:NSLayoutAttributeCenterY
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:_avatorImageView
                                                                             attribute:NSLayoutAttributeCenterY
                                                                            multiplier:1
                                                                              constant:0];
        
        NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:_userNameLabel
                                                                            attribute:NSLayoutAttributeHeight
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:nil
                                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                                           multiplier:1
                                                                             constant:17];
        
        NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:_userNameLabel
                                                                           attribute:NSLayoutAttributeRight
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:_avatorImageView
                                                                           attribute:NSLayoutAttributeLeft
                                                                          multiplier:1
                                                                            constant:-kLeftRightPadding];
        
        NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:_userNameLabel
                                                                          attribute:NSLayoutAttributeLeft
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self
                                                                          attribute:NSLayoutAttributeLeft
                                                                         multiplier:1
                                                                           constant:kLeftRightPadding];
        
        [self addConstraints:@[centerYConstraint, heightConstraint, rightConstraint, leftConstraint]];
    }
}



@end
