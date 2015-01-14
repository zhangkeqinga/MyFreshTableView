//
//  ViewController.m
//  FreshTableDemo2.0
//
//  Created by Dong on 15-1-7.
//  Copyright (c) 2015年 jhony. All rights reserved.
//

#import "ViewController.h"
#import "PullingRefreshTableView.h"

@interface ViewController ()

@end
#define PI 3.1415926

@implementation ViewController

@synthesize refreshing=_refreshing;
@synthesize tableArray=_tableArray;
@synthesize dataRecordArr=_dataRecordArr;
@synthesize tableviewS=_tableviewS;


- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor=[UIColor whiteColor];
    
    CGRect tableFrame =CGRectMake(0, 60, 320, 400);
    tableViewS = [[PullingRefreshTableView alloc] initWithFrame:tableFrame pullingDelegate:self];
    tableViewS.dataSource = self;
    tableViewS.delegate = self;
    tableViewS.backgroundColor=[UIColor grayColor];
    [self.view addSubview:tableViewS];
    
    
    
    
//    tableViewS=[[PullingRefreshTableView alloc]initWithFrame:CGRectMake(0, 60, 320, 400) style:UITableViewStylePlain];
//    tableViewS.delegate=self;
//    tableViewS.dataSource=self;
//    tableViewS.backgroundColor=[UIColor grayColor];
//    [self.view addSubview:tableViewS];
    
}


#pragma mark -
#pragma mark -- pull-down

- (void)loadData
{
    //数据 报错  bug
//    if (self.refreshing) {
//        self.refreshing = NO;
//    }
    
    
    if (_tableArray.count == 0)
    {
        [self.tableviewS tableViewDidFinishedLoadingWithMessage:@"暂无信息！"];
        self.tableviewS = nil;
        
    }else if (self.dataRecordArr.count < pageIndex) {    //如果请求的数据count小于当前的页数就代表数据请求完毕
        
        [self.tableviewS tableViewDidFinishedLoadingWithMessage:@"全部加载!"];
        self.tableviewS.reachedTheEnd  = YES;
        
    } else {
        
        self.tableviewS.reachedTheEnd  = NO;
        [self.tableviewS tableViewDidFinishedLoading];
    }
    [self.tableviewS reloadData];
    
    
}

#pragma  mark -
#pragma  mark - PullingRefreshTableViewDelegate
- (void)pullingTableViewDidStartRefreshing:(PullingRefreshTableView *)tableView
{
    
    self.refreshing = YES;
    
    [self performSelector:@selector(loadData) withObject:nil afterDelay:3.f];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    [tableViewS tableViewDidScroll:scrollView];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [tableViewS tableViewDidEndDragging:scrollView];
}


#pragma mark -- UITableViewDelegate


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CELLID = @"cellid";
    
    UITableViewCell* cell= (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:CELLID];
    if (cell == nil){
        cell=[[UITableViewCell alloc]init];//zkq
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        [cell setBackgroundColor:[UIColor clearColor]];
    }
    cell.textLabel.text=[NSString stringWithFormat:@"%d",(int )indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
