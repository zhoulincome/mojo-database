//
//  ViewController.m
//  indexpath
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 Hong XIing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webview;

@end

#define MYBUNDLE_NAME @ "login.bundle"
#define MYBUNDLE_PATH [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: MYBUNDLE_NAME]
#define MYBUNDLE [NSBundle bundleWithPath: MYBUNDLE_PATH]

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    self.title = @"登录";
    NSString * htmlPath = [[NSBundle mainBundle] pathForResource:@"loginUser" ofType:@"html"];
    NSString * htmlCont = [NSString stringWithContentsOfFile:htmlPath encoding:NSUTF8StringEncoding error:nil];    // 获取当前应用的根目录
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSURL *baseURL = [NSURL fileURLWithPath:path];    // 通过baseURL的方式加载的HTML// 可以在HTML内通过相对目录的方式加载js,css,img等文件
    self.webview.frame = CGRectMake(0, 0, 400, 700);
    [_webview loadHTMLString:htmlCont baseURL:baseURL];
    self.webview.backgroundColor = [UIColor whiteColor];
//    NSString *htmlPath = [NSString stringWithFormat:@"%@/%@",MYBUNDLE_PATH,@"loginUser.html"];
//    NSString * htmlCont = [NSString stringWithContentsOfFile:htmlPath encoding:NSUTF8StringEncoding error:nil];    // 获取当前应用的根目录
    self.webview.scrollView.scrollEnabled = NO;
//    [_webview loadHTMLString:htmlCont baseURL:[NSURL URLWithString:MYBUNDLE_PATH]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSLog(@"shouldStartLoadWithRequest = %ld request = %@",navigationType,request.URL);
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"webViewDidStartLoad webView = %@",webView);
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"webViewDidFinishLoad webView = %@",webView);
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)errorb{
    NSLog(@"didFailLoadWithError webView = %@",webView);
}

@end
